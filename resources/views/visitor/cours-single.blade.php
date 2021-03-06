@extends('visitor.layout')
@section('content')

<div class="page-title parallax parallax4">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="page-title-heading">
                    <h2 class="title">{{ $cours->title }}</h2>
                </div><!-- /.page-title-heading -->
                <div class="breadcrumbs">
                    <ul>
                        <li><a href="{{ url('/') }}">Home</a></li>
                        <li>Cours Demo</li>
                    </ul>
                </div><!-- /.breadcrumbs -->
            </div><!-- /.col-md-12 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div><!-- /page-title parallax -->

<section class="main-content blog-posts course-single">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="blog-title-single">
                    <h1 class="bold">{{ $cours->title }}</h1>
                    <ul class="course-meta review style2 clearfix">
                        <li class="author">
                            <div class="thumb">
                                <img src="{{ asset('storage/'.$cours->teacher->user->avatar) }}" alt="{{ $cours->teacher->user->name }}">
                            </div>

                            <div class="text">
                                <a href="{{ url('teachers/'.$cours->teacher->slug) }}">{{ $cours->teacher->user->name }}</a>
                                <p>Teacher</p>
                            </div>
                        </li>
                        <li class="categories">
                            <a href="{{ url('courses/category/'.$cours->category->slug) }}" class="course-name">{{ $cours->category->name }}</a>
                            <p>Category</p>
                        </li>
                        <li class="review-stars">
                            @for($i=1; $i<=5; $i++) @if($i <=$cours->rate())
                                <i class="fa fa-star"></i>
                                @else
                                <i class="fa fa-star-o"></i>
                                @endif
                                @endfor
                                <p>Reviews</p>
                        </li>

                        <li>{{ $cours->courseSessions->count()}} Sessions</li>
                    </ul>

                    <div class="feature-post">
                        <img src="{{ asset('storage/'.$cours->image) }}" alt="{{ $cours->title }}">
                    </div><!-- /.feature-post -->
                    <div class="course-widget-price">
                        <h4 class="course-title">COURSE FEATURES</h4>
                        <ul>
                            <li>
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                <span>Starts</span>
                                @php
                                $date0 = explode(' ',$cours->updated_at);
                                $date = explode('-',$date0[0]);
                                $M= $date[1];
                                $D = $date[2];
                                $Y = $date[0];
                                $dateObj = DateTime::createFromFormat('!m', $M);
                                $monthName = $dateObj->format('F')
                                @endphp
                                <span class="time">{{ $monthName }} {{ $D }}, {{ $Y }}</span>
                            </li>
                            <li>
                                <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
                                <span>Duration</span>
                                <span class="time">{{ $cours->duration }} Hours</span>
                            </li>

                            <li>
                                <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                <span>Institution</span>
                                <span class="time">{{ $cours->location }}</span>
                            </li>
                            <li>
                                <i class="fa fa-user-plus" aria-hidden="true"></i>
                                <span>Seats Available</span>
                                <span class="time">{{ $cours->nbr_student}} Student</span>
                            </li>
                            <li>
                                <i class="fa fa-users" aria-hidden="true"></i>
                                <span>Level</span>
                                <span class="time">{{ $cours->level }}</span>
                            </li>
                            <li>
                                <i class="fa fa-leanpub" aria-hidden="true"></i>
                                <span>Session</span>
                                <span class="time">{{ $cours->courseSessions->count() }}</span>
                            </li>
                        </ul>
                        <h5 class="bt-course">Course Price: <span>{{ $cours->price }} DH</span></h5>
                        <a class="flat-button bg-orange" href="courses-single.html#">ENROLL THIS COURSE</a>
                    </div>

                    <div class="entry-content">
                        <h4 class="title-1 bold">ABOUT THE COURSES</h4>
                        <p>
                            {{ $cours->small_description }}
                        </p>

                        <div class="flat-spacer h8px"></div>

                        {!! $cours->description !!}

                        <ul class="curriculum">
                            <h4 class="bold mgbt-17">SESSIONS</h4>
                            @foreach($cours->courseSessions as $courseSession)

                            <li class="section">
                                <h4 class="section-title">
                                    <div class="row">
                                        <div class="col-md-10">Section {{ $courseSession->step}} : {{ $courseSession->title}}</div>
                                        <div class="col-md-2 text-right">
                                            <span class="badge badge-warning text-right" style="background-color: #ffaa30;"> {{ $courseSession->date }} &nbsp;</span>
                                        </div>
                                    </div>
                                </h4>
                                <ul class="section-content">

                                    @foreach($courseSession->courseItems as $courseItem)

                                    <li class="course-lesson">
                                        <a class="lesson-title">{{ $courseItem->title }}</a>
                                    </li>

                                    @endforeach
                                </ul>
                            </li>
                            @endforeach

                        </ul>

                    </div><!-- /.entry-post -->
                </div><!-- /.main-post -->

                <section class="flat-row pad-bottom-30">
                    <div class="container">
                        <div class="flat-title-section">
                            <h4 class="bold mgbt-17">COURS FAQS :</h4>
                        </div>
                        <div class="row">
                            <div class="flat-accordion">
                                @foreach($cours->courseFaqs as $courseFaq)
                                <div class="flat-toggle">
                                    <h6 class="toggle-title">
                                        <div class="row">
                                            <div class="col-md-10">{{ $courseFaq->title }}</div>
                                            <div class="col-md-2 text-right"><span class="badge badge-warning" style="background-color: #ffaa30;">{{ explode(' ',$courseFaq->updated_at)[0] }}</span>&nbsp;</div>
                                        </div>

                                    </h6>
                                    <div class="toggle-content">
                                        <div>
                                            {{ $courseFaq->content }}
                                        </div>
                                    </div>
                                </div><!-- /toggle -->
                                @endforeach
                            </div><!-- /.flat-accordion -->
                        </div><!-- / .col-md-6 -->
                    </div>
                </section>

                <section class="flat-row pad-bottom-30">
                    <div class="container">
                        <div class="flat-title-section">
                            <h4 class="bold mgbt-17">QUESTIONS :</h4>
                        </div>
                        <div class="row">
                            <div class="flat-accordion">

                                @foreach($cours->questions as $question)
                                @if($question->answer != null)
                                <div class="flat-toggle">
                                    <h6 class="toggle-title">
                                        <div class="row">
                                            <div class="col-md-10">{{ $question->question }}</div>
                                            <div class="col-md-2 text-right"><span class="badge badge-warning" style="background-color: #ffaa30;">{{ explode(' ',$question->updated_at)[0] }}</span>&nbsp;</div>
                                        </div>
                                    </h6>
                                    <div class="toggle-content">
                                        <div>
                                            {{ $question->answer->reponse }}
                                        </div>
                                    </div>
                                </div><!-- /toggle -->
                                @endif
                                @endforeach
                                <button type="button" class="flat-button bg-orange" data-toggle="modal" data-target="#exampleModalCenterQuestion">
                                    Add Question
                                </button>
                                <br>
                                <br><br>

                                <!-- Modal -->
                                <div style="margin-top: 100px" class="modal fade" id="exampleModalCenterQuestion" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <h5 class="modal-title" id="exampleModalCenterTitle">Send us your questions :</h5>
                                                    </div>
                                                    <div class="col-md-2 text-right">
                                                        <a style="color: red;" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-body">

                                                <p>Your email address will not be published. Required fields are marked *</p>
                                                <form class="flat-contact-form" id="contactform6" @submit.prevent="addQuestion">

                                                    <input v-validate="'required'" type="text" tabindex="1" placeholder="Name*" name="full_name" v-model="question.full_name">
                                                    <div v-show="errors.has('full_name')" class="invalid-feedback">
                                                        <i v-show="errors.has('full_name')" class="fa fa-warning"></i>
                                                        @{{ errors.first('full_name') }}
                                                    </div>

                                                    <input v-validate="'email'" type="email" tabindex="2" placeholder="Email" name="email" v-model="question.email">
                                                    <div v-show="errors.has('email')" class="invalid-feedback">
                                                        <i v-show="errors.has('email')" class="fa fa-warning"></i>
                                                        @{{ errors.first('email') }}
                                                    </div>

                                                    <textarea v-validate="'required|min:10|max:600'" class="type-input" tabindex="3" placeholder="Comment*" name="question" id="message-contact1" v-model="question.question"></textarea>
                                                    <div v-show="errors.has('question')" class="invalid-feedback">
                                                        <i v-show="errors.has('question')" class="fa fa-warning"></i>
                                                        @{{ errors.first('question') }}
                                                    </div>

                                                    <div v-if="!!etat" class="alert alert-success" role="alert">
                                                        <strong>@{{ succes }}</strong>
                                                    </div>

                                                    <button type="submit" class="flat-button bg-orange">Post Comment</button>
                                                    <button class="btn btn-danger bg-danger" data-dismiss="modal" aria-label="Close">
                                                        Close
                                                    </button>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div><!-- /.flat-accordion -->
                        </div><!-- / .col-md-6 -->
                    </div>
                </section>

                <div class="author-post">
                    <h4 class="title author-title">ABOUT INSTRUCTOR</h4>
                    <div class="author-body">
                        <div class="author-avatar">
                            <div class="thumb">
                                <img src="{{ asset('storage/'.$cours->teacher->user->avatar) }}" width="100px" alt="{{ $cours->teacher->user->name }}">
                            </div>
                            <div class="info clearfix">
                                <div class="text">
                                    <h6><a href="{{ url('teachers/'.$cours->teacher->slug) }}">{{ $cours->teacher->user->name }}</a></h6>
                                    <p>{{ $cours->teacher->category->name }}</p>

                                    <ul class="flat-socials">
                                        <li class="facebook">
                                            <a href="{{ $cours->teacher->facebook }}"><i class="fa fa-facebook"></i></a>
                                        </li>
                                        <li class="twitter">
                                            <a href="{{ $cours->teacher->twitter }}"><i class="fa fa-twitter"></i></a>
                                        </li>
                                        <li class="linkedin">
                                            <a href="{{ $cours->teacher->linkedin }}"><i class="fa fa-linkedin"></i></a>
                                        </li>
                                        <li class="youtube">
                                            <a href="{{ $cours->teacher->youtube }}"><i class="fa fa-youtube-play"></i></a>
                                        </li>
                                    </ul>

                                </div>
                            </div>
                            <!--/.author-avatarr -->
                            <p class="desc">
                                {{ $cours->teacher->description }}
                            </p>
                        </div>
                        <!--/.author-info -->
                    </div>
                    <!--/.author-info -->




                    <div class="comment-post" id="courseSingleComment">
                        <div class="comment-list-wrap">
                            <h4 class="title comment-title">Comments (@{{ nbrComments() }}) </h4>
                            <ul class="comment-list">
                                <li> 
                                    <div v-if="action == 'deleteComment'" id="subscribe-msg" style="height: 100%; margin-top: 10px">
                                        <div class="alert alert-success" role="alert">
                                            <strong>your comment is delete</strong>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div v-if="action == 'addCommentReply'" id="subscribe-msg" style="max-width: 100%; margin-top: 10px">
                                        <div class="alert alert-success" role="alert">
                                            <strong>your comment Reply is added</strong>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div v-if="action == 'updateComment'" id="subscribe-msg" style="max-width: 100%; margin-top: 10px">
                                        <div class="alert alert-success" role="alert">
                                            <strong>your comment is updated</strong>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div v-if="action == 'deleteCommentReply'" id="subscribe-msg" style="max-width: 100%; margin-top: 10px">
                                        <div class="alert alert-success" role="alert">
                                            <strong>your comment is deleted</strong>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div v-if="action == 'updateCommentReply'" id="subscribe-msg" style="max-width: 100%; margin-top: 10px">
                                        <div class="alert alert-success" role="alert">
                                            <strong>your comment is updated</strong>
                                        </div>
                                    </div>                 
                                </li>

                                <li v-for="comment in comments">
                                    <article class="comment">

                                        @auth
                                        <div class="text-right">
                                        <h4>
                                            <a v-if="comment.user_id == '@auth {{ Auth::user()->id }} @endauth'" @click="preperComment(comment)" type="button" data-toggle="modal" data-target="#exampleModaDeleteComment"><i class="fa fa-trash-o"></i></a>
                                            <a v-if="comment.user_id == '@auth {{ Auth::user()->id }} @endauth'" @click="preperComment(comment)" type="button" data-toggle="modal" data-target="#exampleModalUpdateComment"><i class="fa fa-edit"></i></a>
                                        </h4>
                                        </div>
                                        @endauth
                                        
                                        <div class="comment-avatar thmub">
                                            <img style="border-radius: 90px;" :src="'{{ asset('storage/') }}/' + comment.user.avatar" width="90px" :alt="comment.user.name">
                                        </div>
                                        <div class="comment-detail">
                                            <div class="comment-meta">
                                                <p class="comment-author"><a>@{{ comment.user.name }}</a></p>
                                                <p v-if="comment.type.toUpperCase() == 'teacher'.toUpperCase()" class="comment-date">@{{ dateFormat(comment.created_at )}} &nbsp;<span style="background-color: #ffaa30;" class="badge badge-warning">@{{ comment.type }}</span></p>
                                                <p v-if="comment.type.toUpperCase() == 'student'.toUpperCase()" class="comment-date">@{{ dateFormat(comment.created_at )}} &nbsp;<span class="badge badge-warning">@{{ comment.type }}</span></p>
                                            </div>
                                            <p class="comment-body">@{{ comment.comment }}</p>
                                            @auth
                                            <a @click="preperCommentReply(comment.id)" type="button" data-toggle="modal" data-target="#exampleModalAddCommentReply" class="comment-reply">Reply</a>
                                            @endauth
                                        </div><!-- /.comment-detail -->
                                    </article><!-- /.comment -->

                                    <ul v-for="commentReplie in comment.comment_replies">
                                        <li>
                                        <article class="comment style1 style1">
                                            @auth
                                            <div class="text-right">
                                                <h5>
                                                <a v-if="commentReplie.user_id == '@auth {{ Auth::user()->id }} @endauth'" @click="preperCommentReplyDelete(commentReplie)" type="button" data-toggle="modal" data-target="#exampleModaDeleteCommentReply"><i class="fa fa-trash-o"></i></a>
                                                <a v-if="commentReplie.user_id == '@auth {{ Auth::user()->id }} @endauth'" @click="preperCommentReplyDelete(commentReplie)" type="button" data-toggle="modal" data-target="#exampleModalUpdateCommentReply"><i class="fa fa-edit"></i></a>
                                                </h5>
                                            </div>
                                            @endauth
                                            <div class="comment-avatar thmub">
                                                <img style="border-radius: 90px;" :src="'{{ asset('storage/') }}/' + commentReplie.user.avatar" width="80px" :alt="commentReplie.user.name">
                                            </div>
                                            <div class="comment-detail">
                                                <div class="comment-meta">
                                                    <p class="comment-author"><a>@{{ commentReplie.user.name }}</a></p>
                                                    <p v-if="commentReplie.type.toUpperCase() == 'teacher'.toUpperCase()" class="comment-date">@{{ dateFormat(commentReplie.created_at )}} &nbsp;<span style="background-color: #ffaa30;" class="badge badge-warning">@{{ commentReplie.type }}</span></p>
                                                    <p v-if="commentReplie.type.toUpperCase() == 'student'.toUpperCase()" class="comment-date">@{{ dateFormat(commentReplie.created_at )}} &nbsp;<span class="badge badge-warning">@{{ commentReplie.type }}</span></p>
                                                </div>
                                                <p class="comment-body">@{{ commentReplie.comment }}</p>
                                                @auth
                                                <a @click="preperCommentReply(comment.id)" type="button" data-toggle="modal" data-target="#exampleModalAddCommentReply" class="comment-reply">Reply</a>
                                                @endauth
                                            </div>
                                        </article>
                                        </li>         
                                    </ul>
                                </ul><!-- /.comment-list -->



                            @guest
                                <div style="max-width: 100%; margin-top: 10px" title="Login">
                                <a href="/login" class="bg-danger">
                                    <div class="alert alert-danger" role="alert">
                                        <strong>you have to identify to add a comment</strong>                                        
                                    </div>
                                    </a> 
                                </div>
                            @else
                            <!-- Modal edite-->
                            <div style="margin-top: 100px" class="modal fade" id="exampleModalUpdateComment" tabindex="-1" role="dialog" aria-labelledby="exampleModaAddReplay" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Edit Your Comment </h5>    
                                        </div>
                                        <div class="modal-body">
                                            <p>Edit your comment *</p>
                                            <form class="flat-contact-form" id="updateComment" @submit.prevent="updateComment('updateComment')" data-vv-scope="updateComment">
                                                <textarea v-validate="'required|min:2|max:255'" class="type-input" style="height: 150px;" placeholder="Comment*" name="comment" id="message-contact1" v-model="comment.comment"></textarea>
                                                <div v-show="errors.has('updateComment.comment')" class="invalid-feedback">
                                                    <i v-show="errors.has('updateComment.comment')" class="fa fa-warning"></i>    
                                                    @{{ errors.first('updateComment.comment') }}
                                                </div>
                                                <button type="submit" class="flat-button" style="background-color: #ffaa30;">
                                                    Edit
                                                </button>
                                                <button @click="notPreperComment" class="flat-button" data-dismiss="modal" aria-label="Close" style="background-color: red;">
                                                    Close
                                                </button> 
                                                <div v-if="action == 'updateComment'" id="subscribe-msg" style="max-width: 100%; margin-top: 10px">
                                                    <div class="alert alert-success" role="alert">
                                                        <strong>your comment is updated</strong>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal delete-->
                            <div style="margin-top: 100px" class="modal fade bd-example-modal-xl" id="exampleModaDeleteComment" tabindex="-1" role="dialog" aria-labelledby="exampleModaAddReplay" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Delete Comment</h5>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure that you wante to delete this comment *</p>
                                            <form class="flat-contact-form" id="deleteComment">
                                                <button @click="deleteComment" class="flat-button" style="background-color: red;" type="button" data-dismiss="modal" aria-label="Close">
                                                    Delete
                                                </button>
                                                <button class="flat-button" style="background-color: #ffaa30;" data-dismiss="modal" aria-label="Close">
                                                    Close
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                       
                            <!-- Modal delete-->
                            <div style="margin-top: 100px" class="modal fade bd-example-modal-xl" id="exampleModaDeleteCommentReply" tabindex="-1" role="dialog" aria-labelledby="exampleModaAddReplay" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Delete Comment</h5>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure that you wante to delete this comment **</p>
                                            <form class="flat-contact-form">
                                                <button @click="deleteCommentReply" class="flat-button" style="background-color: red;" type="button" data-dismiss="modal" aria-label="Close">
                                                    Delete
                                                </button>
                                                <button class="flat-button" style="background-color: #ffaa30;" data-dismiss="modal" aria-label="Close">
                                                    Close
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- form add comment -->
                            <div  class="comment-respond">
                                <div v-if="action == 'addComment'" style="height: 100%; margin-top: 10px">
                                    <div class="alert alert-success" role="alert">
                                        <strong>your comment is added</strong>
                                    </div>
                                </div> 
                                <h4 class="title comment-title style1">Leave a comment</h4>
                                <p>Your email address will not be published. Required fields are marked *</p>
                                <form class="flat-contact-form" @submit.prevent="addComment('addComment')" data-vv-scope="addComment">
                                    <textarea v-validate="'required|min:2|max:255'" class="type-input" placeholder="Comment*" name="comment" v-model="comment.comment"></textarea>
                                    <div v-show="errors.has('addComment.comment')" class="invalid-feedback" style="color: red;">
                                        <i v-show="errors.has('addComment.comment')" class="fa fa-warning"></i>    
                                        @{{ errors.first('addComment.comment') }}
                                        <br><br>
                                    </div>
                                    <button class="flat-button bg-orange" type="submit" >Post Comment</button>
                                </form>
                            </div>

                            <!-- Modal add comment Reply -->
                            <div style="margin-top: 100px" class="modal fade" id="exampleModalAddCommentReply" tabindex="-1" role="dialog" aria-labelledby="exampleModalAddCommentReply" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Leave a comment Reply</h5>    
                                        </div>
                                        <div class="modal-body">
                                            <p>Your email address will not be published. Required fields are marked **</p>
                                            <form class="flat-contact-form" @submit.prevent="addCommentReply('addCommentReply')" data-vv-scope="addCommentReply">

                                                <textarea name="comment" v-model="commentReply.comment" v-validate="'required|min:2|max:255'" class="type-input" style="height: 150px;" placeholder="Comment*"></textarea>
                                                <div v-show="errors.has('addCommentReply.comment')" class="invalid-feedback" style="color:red;">
                                                    <i v-show="errors.has('addCommentReply.comment')" class="fa fa-warning"></i>    
                                                    @{{ errors.first('addCommentReply.comment') }}
                                                    <br>
                                                    <br>
                                                </div>
                                                
                                                <button type="submit" class="flat-button" style="background-color: #ffaa30;">
                                                Post Comment
                                                </button>
                                                <button class="flat-button" data-dismiss="modal" aria-label="Close" style="background-color: red;">
                                                    Close
                                                </button> 
                                                <div v-if="action == 'addCommentReply'" style="max-width: 100%; margin-top: 10px">
                                                    <div class="alert alert-success" role="alert">
                                                        <strong>your comment Reply is added</strong>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal edite reply comment-->
                            <div style="margin-top: 100px" class="modal fade" id="exampleModalUpdateCommentReply" tabindex="-1" role="dialog" aria-labelledby="exampleModaAddReplay" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Edit Your Comment </h5>    
                                        </div>
                                        <div class="modal-body">
                                            <p>Edit your comment *</p>
                                            <form class="flat-contact-form" id="updateComment" @submit.prevent="updateCommentReply('updateCommentReply')" data-vv-scope="updateCommentReply">                                            
                                                <textarea name="comment" v-model="commentReply.comment" v-validate="'required|min:2|max:255'" class="type-input" style="height: 150px;" placeholder="Comment*"></textarea>
                                                <div v-show="errors.has('updateCommentReply.comment')" class="invalid-feedback" style="color:red;">
                                                    <i v-show="errors.has('updateCommentReply.comment')" class="fa fa-warning"></i>    
                                                    @{{ errors.first('updateCommentReply.comment') }}
                                                    <br>
                                                    <br>
                                                </div>
                                                <button type="submit" class="flat-button" style="background-color: #ffaa30;">
                                                Edit
                                                </button>
                                                <button class="flat-button" data-dismiss="modal" aria-label="Close" style="background-color: red;">
                                                    Close
                                                </button> 
                                                <div v-if="action == 'updateCommentReply'" style="max-width: 100%; margin-top: 10px">
                                                    <div class="alert alert-success" role="alert">
                                                        <strong>your comment updated</strong>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endauth

                        </div><!-- /.comment-list-wrap -->
                    </div><!-- /.comment-post -->






                </div><!-- /blog-title-single -->
            </div><!-- /col-md-8 -->

            <div class="sidebar">
                <div class="widget widget-categories">
                    <h5 class="widget-title">Categories</h5>
                    <ul>
                        <li>
                            <a href="{{ url('courses/') }}" @if($categoryIdActive=='' ) style="color: #ffaa30;" @endif>All Courses</a>
                            <span class="badge" style="background-color: #ffaa30; color:white;">{{ $countFreeCourses + $countNotFreeCourses}}</span>
                        </li>
                        @foreach($categories as $category)
                        <li>

                            <a href="{{ url('courses/category/'.$category->slug) }}" @if($categoryIdActive=='' .$category->id) style="color: #ffaa30;" @endif>{{ $category->name }}</a>
                            <span class="badge" style="background-color: #ffaa30; color:white;">{{ $category->courses->count() }}</span>
                        </li>
                        @endforeach
                    </ul>
                </div>

                <div class="widget widget-teacher">
                    <h5 class="widget-title">Browse by Teacher</h5>
                    <div class="text-teacher">
                        <p>Lorem ipsum sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                    <ul class="teacher-news clearfix">
                        @foreach($teachers as $teacher)
                        <li>
                            <div class="thumb">
                                <img src="{{ asset('storage/'.$teacher->user->avatar) }}" alt="{{ $teacher->user->name }}">
                            </div>
                            <div class="text">

                                <a href="{{ url('courses/teacher/'.$teacher->slug) }}" title="{{ $teacher->user->name }}">{{ str_limit($teacher->user->name, 13) }}</a>
                                <p>{{ str_limit($teacher->category->name, 15) }}</p>

                            </div>
                            <ul class="flat-socials">
                                <li class="review-stars">
                                    @for($i=1; $i<=5; $i++) @if($i <=$teacher->rate())
                                        <i class="fa fa-star"></i>
                                        @else
                                        <i class="fa fa-star-o"></i>
                                        @endif
                                        @endfor
                                </li>
                            </ul>
                        </li>
                        @endforeach

                    </ul><!-- /popular-news clearfix -->
                    <center>{{ $teachers->links() }}</center>
                </div>

                <div class="widget widget-featured-courses">
                    <h5 class="widget-title">Best courses</h5>
                    <ul class="featured-courses-news clearfix">
                        @foreach($bestPriceCourses as $bestPriceCourse)
                        <li>
                            <div class="thumb">
                                <img src="{{ asset('storage/'.$bestPriceCourse->image) }}" alt="{{ $bestPriceCourse->title }}" width="105px">
                            </div>
                            <div class="text">
                                <a href="{{ url('courses/'.$bestPriceCourse->slug) }}" title="{{ $bestPriceCourse->title }}">{{ str_limit($bestPriceCourse->title, 18) }}</a>
                                <p>{{ $bestPriceCourse->teacher->user->name }}</p>
                            </div>
                            <div class="review-rating">
                                <div class="flat-money">
                                    <p>{{ $bestPriceCourse->price }} DH</p>
                                </div>
                                <div class="flat-money" style="background-color: #ffaa30;">
                                    <a href="{{ url('courses/'.$bestPriceCourse->slug) }}">
                                        <p>+</p>
                                    </a>
                                </div>

                            </div>
                        </li>
                        @endforeach

                    </ul><!-- /popular-news clearfix -->
                </div><!-- /widget widget-popular-news -->
            </div><!-- /sidebar -->
        </div><!-- /row -->
    </div><!-- /container -->
</section><!-- /main-content -->

@endsection

@section('js')
<script>
    window.Laravel.course_id = '{{ $cours->id }}';

    @guest
        @php
            $cours->teacher->user->role;
        @endphp
        window.Laravel.user = {!!json_encode($cours->teacher->user) !!};
    @else
        @auth
            @php
                // refresh les relation
                Auth::user()->role;
            @endphp
            window.Laravel.user = {!!json_encode( Auth::user()) !!};
        @endauth
    @endauth

    
</script>

<script type="text/javascript" src="{{ asset('js/vue/coursSingleQuestion.js') }}"></script>
<script type="text/javascript" src="{{ asset('js/vue/coursSingleComment.js') }}"></script>

@endsection