@extends('visitor.layout')
@section('content')

    <div class="page-title parallax parallax4"> 
    	<div class="overlay"></div>            
        <div class="container">
            <div class="row">
                <div class="col-md-12">                    
                    <div class="page-title-heading">
                        <h2 class="title">CONTACT US</h2>
                    </div><!-- /.page-title-heading -->
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li>contact</li>
                        </ul>                   
                    </div><!-- /.breadcrumbs --> 
                </div><!-- /.col-md-12 -->  
            </div><!-- /.row -->  
        </div><!-- /.container -->                      
    </div><!-- /page-title parallax -->
	
      <section class="flat-row contact-page pad-top-134">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="contact-content">
                            <div class="contact-address">
                                <div class="style1">                                    
                                   <img src="images/icon/c1.png" alt="image">
                                </div> 
                                <div class="details">
                                    <h5>Our Location</h5>
                                    <p>Km 9, Route d'Agadir, Essaouira Aljadida</p>
                                    <p>BP. 383, Ghazoua</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="contact-content">
                            <div class="contact-address">
                                <div class="style1">
                                    <img src="images/icon/c2.png" alt="image">
                                </div>
                                <div class="details">
                                    <h5>Contact us Anytime</h5>
                                    <p>Mobile: (+212) 641 966 888 </p>
                                    <p>Fax: (+212) 690 999 004</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="contact-content">
                            <div class="contact-address">
                                <div class="style1">
                                    <img src="images/icon/c3.png" alt="image">
                                </div>
                                <div class="details">
                                    <h5>Write Some Words</h5>
                                    <p>Support24/7@e-learning.com </p>
                                    <p>Info@e-learning.com</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.row -->

                <div class="row">
                    <div class="flat-spacer d74px"></div>
                </div>

                <div class="comment-respond contact style2">
                    <h1 class="title comment-title">Leave a Message</h1>
                    <form class="flat-contact-form style2 bg-dark height-small" method="post" action="{{ url('contact-us') }}">
                    @csrf
                        <div class="field clearfix">      
                            <div class="wrap-type-input">                    
                                <div class="input-wrap name">
                                    <input type="text" placeholder="Name" name="full_name" required>
                                </div>
                                <div class="input-wrap email">
                                    <input type="email" placeholder="Email" name="email" required>
                                </div>
                                <div class="input-wrap last Subject">
                                    <input type="text" placeholder="Subject (Optinal)" name="object" required>
                                </div>  
                            </div>
                            <div class="textarea-wrap">
                                <textarea class="type-input" placeholder="Message" name="content" required></textarea>
                                @if ($message = Session::get('success'))
                                <br>
                                <div class="alert alert-success alert-block">
                                    <strong>{{ $message }}</strong>
                                </div>
                                @endif
                            </div>
                        </div>
                        <div class="submit-wrap">
                            <button class="flat-button bg-orange">Send Your Message</button>
                        </div>
                    </form><!-- /.comment-form -->                     
                </div><!-- /#respond -->
            </div><!-- /.container -->   
        </section>

        <!-- Map -->
        <section class="row-map">
            <div class="container-fluid">
                <div class="row">
                    <div id="map" style="width: 100%; height: 559px; ">
                
                    </div> 
                </div>
            </div><!-- /.container -->
        </section>
@endsection