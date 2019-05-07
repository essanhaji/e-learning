@extends('visitor.layout')
@section('content')

        <div class="page-title parallax parallax4"> 
        	<div class="overlay"></div>            
            <div class="container">
                <div class="row">
                    <div class="col-md-12">                    
                        <div class="page-title-heading">
                            <h2 class="title">{{ $post->title }}</h2>
                        </div><!-- /.page-title-heading -->
                        <div class="breadcrumbs">
                            <ul>
                                <li><a href="{{ url('/') }}">Home</a></li>
                                <li>Post</li>
                            </ul>                   
                        </div><!-- /.breadcrumbs --> 
                    </div><!-- /.col-md-12 -->  
                </div><!-- /.row -->  
            </div><!-- /.container -->                      
        </div><!-- /page-title parallax -->
    	
        <section class="main-content blog-posts style-v1">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="blog-title-single">
                            <h1 class="bold">{{ $post->title }}</h1>
                            <article class="entry clearfix">
                                <div class="entry-border">
                                    <div class="main-post">
                                        <div class="wrap-img">
                                            <img width="100px" src="{{ asset('storage/'.$post->user->avatar) }}" alt="{{ $post->user->name }}">
                                            <h6>{{ $post->user->name }}</h6>
                                            <div class="entry-meta">
                                            @php
                                                $date0 = explode(' ',$post->updated_at);
                                                $date = explode('-',$date0[0]);
                                                $M= $date[1];
                                                $D = $date[2];
                                                $Y = $date[0];
                                                $dateObj = DateTime::createFromFormat('!m', $M);
                                                $monthName = $dateObj->format('F')
                                            @endphp
                                                <span class="date"><a>{{ $D }} &nbsp; {{ $monthName }}, {{ $Y }}</a></span>
                                                <span class="comment"><a>{{ $post->nbrComents() }} comments</a></span>
                                                <span class="tag"><a href="{{ url('blog/category/'.$post->category->slug) }}">{{ $post->category->name }}</a></span>
                                            </div>
                                        </div>  
                                        
                                        <div class="feature-post">
                                            <img src="{{ asset('storage/'.$post->image) }}" alt="{{ $post->title }}">
                                        </div><!-- /.feature-post -->
                                        <div class="entry-content">
                                            <p>
                                                {!! $post->body !!}
                                            </p>                                   
                                        </div><!-- /.entry-post -->

                                    </div><!-- /.main-post -->
                                    
                                </div><!-- /.entry-border -->
                            </article><!-- /entry clearfix -->

                            



                            <div class="comment-post" id="postSingleComment">
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
                        <a href="{{ url('blog/') }}" @if($categoryIdActive=='' ) style="color: #ffaa30;" @endif>All Posts</a>
                        <span class="badge" style="background-color: #ffaa30; color:white;">{{ $blog->count() }}</span>
                    </li>
                    @foreach($categories as $category)
                    <li>
                        <a href="{{ url('blog/category/'.$category->slug) }}" @if($categoryIdActive=='' .$category->id) style="color: #ffaa30;" @endif>{{ $category->name }}</a>
                        <span class="badge" style="background-color: #ffaa30; color:white;">{{ $category->posts->count() }}</span>
                    </li>
                    @endforeach
                </ul>
            </div>



            <div class="widget widget-popular-news">
                <h5 class="widget-title">Recent posts</h5>
                <ul class="popular-news clearfix">
                    @foreach($lastPosts as $lastPost)
                    <li>
                        <div class="thumb">
                            <img width="100px" src="{{ asset('storage/'.$lastPost->image) }}" alt="{{ $lastPost->title }}">
                        </div>
                        @php
                        $date0 = explode(' ',$lastPost->updated_at);
                        $date = explode('-',$date0[0]);
                        $M= $date[1];
                        $D = $date[2];
                        $Y = $date[0];
                        $dateObj = DateTime::createFromFormat('!m', $M);
                        $monthName = $dateObj->format('F')
                        @endphp
                        <div class="text">
                            <a href="{{ url('blog/'.$lastPost->slug) }}">{{ str_limit($lastPost->title, 28) }}</a>
                            <p>{{ $monthName }} &nbsp; {{ $D }}, {{ $Y }} </p>
                        </div>
                    </li>
                    @endforeach
                </ul><!-- /popular-news clearfix -->
            </div><!-- /widget widget-popular-news -->


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
    window.Laravel.post_id = '{{ $post->id }}';

    @guest
        @php
            $post->user->role;
        @endphp
        window.Laravel.user = {!!json_encode($post->user) !!};
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

<script type="text/javascript" src="{{ asset('js/vue/postSingleComment.js') }}"></script>
@endsection
