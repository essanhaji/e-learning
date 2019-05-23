<!-- sample modal content -->
<div class="modal fade bs-example-modal-lg modalAddCourse" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <form action="{{ url('teacher_insert_course') }}" method="post" enctype="multipart/form-data">
                @csrf
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">Add new course</div>
                                <div class="panel-wrapper collapse in" aria-expanded="true">
                                    <div class="panel-body">
                                        <div class="form-body">

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Title</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="title" placeholder="title" class="form-control" required>
                                                    <span class="help-block"> Course title </span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Price</label>
                                                <div class="col-md-9">
                                                    <input type="number" name="price" min="10" placeholder="price" class="form-control" required>
                                                    <span class="help-block">The price</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Duration</label>
                                                <div class="col-md-9">
                                                    <input type="number" name="duration" min="1" placeholder="duration" class="form-control" required>
                                                    <span class="help-block">The duration (hours)</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Language</label>
                                                <div class="col-md-9">
                                                    <select name="language" class="form-control">
                                                        <option value="English" selected>English</option>
                                                        <option value="French">French</option>
                                                        <option value="Arabic">Arabic</option>
                                                    </select>
                                                    <span class="help-block">choose the language</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Small Description</label>
                                                <div class="col-md-9">
                                                    <textarea name="small_description" min="10" cols="30" rows="4" placeholder="write something here" class="form-control" required></textarea>
                                                    <span class="help-block">Small Description about the course</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Image</label>
                                                <div class="col-md-9">
                                                    <input type="file" name="image" placeholder="image" class="form-control" required>
                                                    <span class="help-block">image (.png .jpeg .jpg .gift)</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Tag</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="tag" placeholder="#education" class="form-control" required>
                                                    <span class="help-block">#tag #e-learning</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Location</label>
                                                <div class="col-md-9">
                                                    <input type="text" min="5" name="location" placeholder="location" class="form-control" required>
                                                    <span class="help-block">EST essaouira</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Number of Student</label>
                                                <div class="col-md-9">
                                                    <input type="number" name="nbr_student" min="1" max="100" placeholder="nbr student" class="form-control" required>
                                                    <span class="help-block">Number of Student</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">Level</label>
                                            <div class="col-md-9">
                                                <input type="text" name="level" class="form-control" placeholder="level" required>
                                                <span class="help-block">Master ou Beginner</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">Category</label>
                                            <div class="col-md-9">
                                                <select name="category_id" class="form-control" required>
                                                    @foreach($categories as $category)
                                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                                    @endforeach
                                                </select>
                                                <span class="help-block">choose the category</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">Active</label>
                                            <div class="col-md-9">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" value="1" name="active" class="custom-control-input" required checked> Enable/Disable
                                                    <span class="help-block">Enable/Disable the course</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">Description</label>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <textarea id="summernote" name="description" required></textarea>
                                                </div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary waves-effect text-left"><i class="fa fa-check"></i>Add</button>
                        <button type="reset" class="btn btn-warning">Reset</button>
                        <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                    </div>
                </div>
        </form>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
