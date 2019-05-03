@extends('visitor.layout')
@section('content')
<!-- Slider -->
<div class="tp-banner-container">
    <div class="tp-banner">
        <ul>
            @foreach($posts as $post)
            <li data-transition="random-static" data-slotamount="7" data-masterspeed="1000" data-saveperformance="on">
                <img src="{{ asset('images/slides/1.jpg') }}" alt="{{ $post->title }}" />
                <a href="{{ url('/blog/'.$post->slug) }}">
                    <div class="tp-caption sfl title-slide center" data-x="174" data-y="250" data-speed="1000" data-start="1000" data-easing="Power3.easeInOut">
                        {{ str_limit($post->title, 20) }}
                    </div>
                </a>
                <div class="tp-caption sfr desc-slide center" data-x="256" data-y="310" data-speed="1000" data-start="1500" data-easing="Power3.easeInOut">
                    @php
                    $text = explode(' ',$post->excerpt);
                    for($i=0; $i < sizeof($text); $i++){ if($i < 10){ echo($text[$i].'&nbsp;'); } if($i>= 10){
                        if($i == 10){
                        echo("<br>");
                        }else{
                        echo($text[$i].'&nbsp;');
                        }
                        }
                        }
                        @endphp
                </div>
                <div class="tp-caption sfl flat-button-slider bg-orange" data-x="420" data-y="439" data-speed="1000" data-start="2000" data-easing="Power3.easeInOut">
                    <a class="" href="{{ url('/courses') }}">START A COURSE</a>
                </div>
                <div class="tp-caption sfr flat-button-slider" data-x="601" data-y="440" data-speed="1000" data-start="2500" data-easing="Power3.easeInOut">
                    <a class="" href="{{ url('/courses') }}">TAKE A TOUR</a>
                </div>
            </li>
            @endforeach

        </ul>
    </div>
</div><!-- /.tp-banner-container -->

<div class="flat-row course row-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-sm-12 flat-pdr-100">
                <h1 class="title-course">Choose The Cours That You Want To Learn</h1>

                <p class='flat-lh-25'>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo quia non debitis consequuntur.
                </p>

                <div class="flat-spacer"></div>

                <div class="flat-button-container">
                    <a class="flat-button orange" href="{{ url('/courses') }}">VIEW ALL COURES</a>
                </div>
            </div>

            <div class="col-md-5 col-sm-12">
                <ul class="flat-course-images">
                    @foreach($courses as $cours)

                    <li>
                        <a href="{{ url('courses/'.$cours->slug) }}"  title="{{ $cours->title }}">                        
                            <img src="{{ asset('storage/'.$cours->image) }}" alt="{{ $cours->title }}" width="220" />
                        </a>
                    </li>

                    @endforeach
                </ul>
            </div>

        </div>
    </div>
</div><!-- /.flat-row -->

<div class=" flat-row popular-course">
    <div class="container">
        <div class="flat-title-section">
            <h1 class="title">POPULAR COURSES</h1>
        </div>

        <div class="flat-course-grid button-right">

            @foreach($bestCourses as $bestCourse)
            <div class="flat-course">
                <div class="featured-post">
                    <div class="overlay">
                        <div class="link"></div>
                    </div>

                    <a href="{{ url('/courses/'.$bestCourse->slug) }}"><img src="{{ asset('storage/'.$bestCourse->image) }}" alt="{{ $bestCourse->title }}"></a>
                </div><!-- /.featured-post -->

                <div class="course-content">
                    <h4><a href="{{ url('/courses/'.$bestCourse->slug) }}">{{ str_limit($bestCourse->title, 25) }}</a></h4>

                    <div class="price">{{ $bestCourse->price }} DH</div>

                    <ul class="course-meta review">
                        <li class="review-stars">
                            @for($i=1; $i<=5; $i++) @if($i <=$bestCourse->rate())
                                <i class="fa fa-star"></i>
                                @else
                                <i class="fa fa-star-o"></i>
                                @endif
                                @endfor
                        </li>

                        <li>
                            {{ $bestCourse->courseSessions->count() }}
                            &nbsp; Sessions
                        </li>
                    </ul>

                    <p>{{ str_limit($bestCourse->small_description, 100) }}</p>

                    <ul class="course-meta desc">
                        <li>
                            <h6>{{ str_limit($bestCourse->created_at, 10, '') }}</h6>
                            <span>Started at</span>
                        </li>

                        <li>
                            <h6>{{ $bestCourse->duration }}</h6>
                            <span>Hours</span>
                        </li>

                        <li>
                            <a href="{{ url('/teachers/'.$bestCourse->teacher->slug) }}">
                                <h6 title="{{ $bestCourse->teacher->user->name }}">{{ str_limit($bestCourse->teacher->user->name, 11) }}</h6>
                            </a>
                            <span>Teacher</span>
                        </li>
                    </ul>
                </div><!-- /.course-content -->
            </div>
            @endforeach

        </div><!-- /.flat-course grid -->
    </div>
</div>

<div class="flat-row join-us parallax parallax1 overlay bg-222">
    <div class="overlay bg-222">
        <div class="container">
            <div class="row">

                <div class="counter-content">
                    <span class="counter-prefix">Join</span>
                    <div class="numb-counter">
                        <div class="numb-count" data-to="{{ $nbrPeoples }}" data-speed="1000" data-waypoint-active="yes">0</div>
                    </div>
                    <span class="counter-suffix">people</span>
                </div>

                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</p>

                <a href="{{ url('/contact') }}" class="flat-button">JOIN NOW</a>
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div>
</div>

<div class=" flat-row lastest-new">
    <div class="container">
        <div class="flat-title-section">
            <h1 class="title">LATEST NEWS</h1>
        </div>

        <div class="row post-lastest-new">

            @foreach($lastPosts as $lastPost)
            <div class="post col-md-4 col-xs-12 col-sm-6 flat-hover-zoom numb">
                <div class="featured-post">
                    <div class="entry-image">
                        <img src="{{ asset('storage/'.$lastPost->image) }}" alt="{{ $lastPost->title }}" width="350px">
                    </div>
                </div>

                <div class="date-post">
                    @php
                    $date0 = explode(' ',$lastPost->updated_at);
                    $date = explode('-',$date0[0]);
                    $M= $date[1];
                    $D = $date[2];
                    $dateObj = DateTime::createFromFormat('!m', $M);
                    $monthName = $dateObj->format('F')
                    @endphp
                    <span class="numb">{{ $D }}</span>
                    <span>{{ $monthName }}</span>
                </div>

                <div class="content-post">
                    <h2 class="title-post">
                        <a href="{{ url('blog/'.$lastPost->slug) }}">{{ str_limit($lastPost->title, 25) }}</a>
                    </h2>

                    <div class="entry-content">
                        <p>
                            {{ str_limit($lastPost->excerpt, 120) }}
                        </p>
                        <div class="entry-meta">
                            <a href="{{ url('blog/category/'.$lastPost->category->slug) }}">
                                <span class="badge badge-warning" style="background-color: #ffaa30;">{{ $lastPost->category->name }}</span>
                            </a>
                        </div>
                    </div><!-- /entry-post -->

                </div><!-- /content-post -->
            </div>
            @endforeach

        </div>

    </div>
</div><!-- /.latest-new -->

<section class="flat-row partners">
    <div class="container">
        <ul class="partners-slider">
            @foreach($sponsors as $sponsor)
            <li>
                <a href="{{ $sponsor->link }}">
                    <img alt="owlcarousel-item-img" src="{{ asset('storage/'.$sponsor->logo) }}" alt="{{ $sponsor->name }}" />
                </a>
            </li>
            @endforeach
        </ul>
    </div>
</section>

<section class="flat-row testimonial">
    <div class="container">
        <div class="testimonial-slider">

            @foreach($studentSays as $studentSay)
            <div class="testimonial">
                <div class="testimonial-content">
                    <blockquote>
                        {{ $studentSay->content }}
                    </blockquote>
                </div>
                <div class="testimonial-meta">
                    <div class="testimonial-author">
                        <strong class="author-name">{{ $studentSay->student->full_name }}</strong>
                    </div>
                </div>
            </div>
            @endforeach

        </div>
    </div>
</section>

<section class="flat-row news-letter">
    <div class="container">
        <div class="have-question">
            <h2 class="">Have any question for us?</h2>

            <p class="flat-lh-28">
                Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                Mirum est notare quam littera gothica, quam nunc putamus parum
            </p>

            <div class="flat-button-container">
                <a class="read-more" href="{{ url('/faqs') }}">Go to Faqs page</a>
            </div>
        </div>

        <div class="news-letter-form" id="newsLetter">
            <div class="widget-mailchimb">
                <h1 class="widget-title">NEWSLETTER</h1>
                <p>Subscribe now and receive weekly newsletter with educational materials, new courses, interesting posts, popular books and much more!</p>
                <form id="subscribe-form" data-mailchimp="true" @submit.prevent="addNewsletter" method="post">
                    <div v-if="action" id="subscribe-content">
                        <div class="input-wrap email">
                            <input v-validate="'required|email'" type="text" id="subscribe-email" name="email" placeholder="Your Email Here" v-model="newsletter.email">
                            
                            <div v-show="errors.has('email')" class="invalid-feedback">
                                <i v-show="errors.has('email')" class="fa fa-warning"></i>    
                                @{{ errors.first('email') }}
                            </div>
                        </div>
                        <div class="button-wrap">
                            <button type="submit" id="subscribe-button" class="subscribe-button" title="Subscribe now"> SUBSCRIBE </button>
                        </div>
                    </div>
                    <div v-else id="subscribe-msg">
                        <div class="alert alert-success" role="alert">
                            <strong>@{{ succes }}</strong>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
@endsection






@section('js')
<!-- vue js et axios -->
<script type="text/javascript" src="{{ asset('js/vue/indexNewsLetter.js') }}"></script>

@endsection