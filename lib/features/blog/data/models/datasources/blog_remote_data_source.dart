import 'dart:io';
import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<String> uploadBlogImage(
      {required File image, required BlogModel blog});
  Future<List<BlogModel>> getAllBlogs();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  BlogRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) {
        throw const ServerException('User must be logged in');
      }

      final blogDocumentRef = firebaseFirestore
          .collection('blogs')
          .doc(user.uid)
          .collection('posterId')
          .doc(blog.id);

      final snapshot = await blogDocumentRef.get();

      final blogData = {
        'id': blog.id,
        'poster_id': blog.posterId,
        'title': blog.title,
        'content': blog.content,
        'image_url': blog.imageUrl,
        'topics': blog.topics,
        'updated_at': FieldValue.serverTimestamp(),
        'poster_name': blog.posterName ?? '',
      };

      if (snapshot.exists) {
        // Update existing blog
        await blogDocumentRef.update(blogData);
      } else {
        // Create new blog
        await blogDocumentRef.set(blogData);
      }

      final updatedBlogData = await blogDocumentRef.get();
      return BlogModel.fromJson(updatedBlogData.data()!);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadBlogImage(
      {required File image, required BlogModel blog}) async {
    try {
      final storageRef =
          firebaseStorage.ref().child('blog_images').child(blog.id);
      await storageRef.putFile(image);
      return await storageRef.getDownloadURL();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) {
        throw const ServerException('User must be logged in');
      }

      final querySnapshot = await firebaseFirestore
          .collection('blogs')
          .doc(user.uid)
          .collection('posterId')
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return BlogModel.fromJson(data);
      }).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
