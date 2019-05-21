<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



//----------------------------------->>>>>> Student
///////////////////////////////////////////////////
Route::get('/student', 'HomeController@indexStudent');




//----------------------------------->>>>>> Teacher
///////////////////////////////////////////////////
Route::get('/teacher', 'HomeController@indexTeacher');




//----------------------------------->>>>>> Admin
///////////////////////////////////////////////////
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});




//----------------------------------->>>>>> Home
///////////////////////////////////////////////////


#.... Authentification
Route::get('login', 'HomeControllerAuth@login');
Route::get('register', 'HomeControllerAuth@register');
Auth::routes();
// consulter les roles
Route::get('/userhaslogin', 'HomeController@userHasLogin');
Route::get('home', 'HomeController@index')->middleware('auth');


#.... about us
Route::get('/about-us', 'AboutAsController@index');
Route::get('faqs', 'AboutAsController@index');
Route::get('events', 'AboutAsController@index');

#.... index
Route::get('/', 'HomeIndexController@index');
Route::post('home/newsletter', 'HomeIndexController@newsletter');
Route::post('home/footerFormContact', 'HomeIndexController@footerFormContact');


#.... courses
Route::post('courses', 'HomeCoursesController@index4');//search
Route::get('courses', 'HomeCoursesController@index1');
Route::get('courses/category/{slug}', 'HomeCoursesController@index2');
Route::get('courses/teacher/{slug}', 'HomeCoursesController@index3');


#.... Cours single
Route::get('courses/{slug}', 'HomeSinglCoursController@index');
Route::post('courses/cours-single/addquestion', 'HomeSinglCoursController@addQuestion');
// comments
Route::get('courses/comments/getcomment/{id}', 'HomeSinglCoursController@getComment');
Route::post('courses/comments/addcomment', 'HomeSinglCoursController@addComment');
Route::put('courses/comments/updatecomment', 'HomeSinglCoursController@updateComment');
Route::delete('courses/comments/deletecomment/{id}', 'HomeSinglCoursController@deleteComment');
// comments replies
Route::post('courses/comments/addcommentreply', 'HomeSinglCoursController@addCommentReply');
Route::delete('courses/comments/deletecommentreply/{id}', 'HomeSinglCoursController@deleteCommentReply');
Route::put('courses/comments/updatecommentreply', 'HomeSinglCoursController@updateCommentReply');


#.... All teachers
Route::get('teachers/{search?}/{key?}', 'HomeTeachersController@index');


#.... teacher profile
Route::get('teachers/{slug}', 'HomeTeacherProfileController@index');


#.... single post
Route::get('blog/{slug}', 'HomeSinglePoseController@index');
// comments
Route::get('post/comments/getcomment/{id}', 'HomeSinglePoseController@getComment');///==>
Route::post('post/comments/addcomment', 'HomeSinglePoseController@addComment');
Route::put('post/comments/updatecomment', 'HomeSinglePoseController@updateComment');
Route::delete('post/comments/deletecomment/{id}', 'HomeSinglePoseController@deleteComment');
// comments replies
Route::post('post/comments/addcommentreply', 'HomeSinglePoseController@addCommentReply');
Route::delete('post/comments/deletecommentreply/{id}', 'HomeSinglePoseController@deleteCommentReply');
Route::put('post/comments/updatecommentreply', 'HomeSinglePoseController@updateCommentReply');


#.... blog all posts
Route::get('blog/{category?}/{slug?}', 'HomeBlogController@index');


#.... Contact
Route::get('contact', 'HomeContactController@index');
Route::post('contact-us', 'HomeContactController@addContact');






