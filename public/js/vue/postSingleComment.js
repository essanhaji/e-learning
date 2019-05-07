var postSingleComment = new Vue({
    el: "#postSingleComment",
    data: {
        comments: [],
        action: '',
        actionDelete: false,
        actionAddReply: false,
        comment: {
            id: 0,
            user_id: window.Laravel.user.id,
            post_id: window.Laravel.post_id,
            type: window.Laravel.user.role.name,
            comment: "",
            user: window.Laravel.user,
            commentReplies: []
        },
        commentReply: {
            id: 0,
            user_id: window.Laravel.user.id,
            type: window.Laravel.user.role.name,
            comment: "",
            comment_id: 1,
            user: window.Laravel.user
        }
    },
    methods: {
        dateFormat:function(date){
            let today = new Date(date).toLocaleDateString('en-GB', {  
                day : 'numeric',
                month : 'short',
                year : 'numeric',
                hour: '2-digit',
	            minute: '2-digit'
            });
            return today;
        },
        nbrComments: function() {
            let nbr = 0;
            this.comments.forEach(element => {
                nbr += element.comment_replies.length
            });
            return nbr + this.comments.length;
        },
        getComments: function() {
            axios
                .get(
                    window.Laravel.url +
                        "/post/comments/getcomment/" +
                        window.Laravel.post_id
                )
                .then(response => {
                    this.action = '';
                    this.comments = response.data.data;
                })
                .catch(error => {
                    console.log("errors : ", error);
                });
        },
        addComment: function(scope) {
            this.$validator.validateAll(scope).then(result => {
                if (result) {

                    axios
                        .post(
                            window.Laravel.url +
                                "/post/comments/addcomment/",
                            this.comment
                        )
                        .then(response => {
                            if (response.data.etat) {
                                this.action = 'addComment';
                                this.comments.unshift(response.data.comment);
                                this.comment = {
                                    id: 0,
                                    user_id: window.Laravel.user.id,
                                    post_id: window.Laravel.post_id,
                                    type: window.Laravel.user.role.name,
                                    comment: "Comment*",
                                    user: window.Laravel.user,
                                    commentReplies: []
                                };
                            }
                        })
                        .catch(error => {
                            console.log("errors : ", error);
                        });

                    return;
                }
                alert("Correct them errors !!");
            });
        },
        preperComment: function(comment) {
            this.action = '';
            this.comment = comment;
        },
        notPreperComment: function() {
            this.action = '';
            this.comment = {
                id: 0,
                user_id: window.Laravel.user.id,
                post_id: window.Laravel.post_id,
                type: window.Laravel.user.role.name,
                comment: "Comment*",
                user: window.Laravel.user,
                commentReplies: []
            };
        },
        updateComment: function(scope) {
            this.$validator.validateAll(scope).then(result => {
                if (result) {

                    axios
                        .put(
                            window.Laravel.url +
                                "/post/comments/updatecomment",
                            this.comment
                        )
                        .then(response => {
                            if (response.data.etat) {
                                this.action = 'updateComment';
                            }
                        })
                        .catch(error => {
                            console.log("errors : ", error);
                        });

                    return;
                }
                alert("Correct them errors !!");
            });
        },
        deleteComment: function() {
            axios
                .delete(
                    window.Laravel.url +
                        "/post/comments/deletecomment/" +
                        this.comment.id
                )
                .then(response => {
                    if (response.data.etat) {
                        this.comments.splice(
                            this.comments.indexOf(this.comment),
                            1
                        );
                        this.action = 'deleteComment';
                        this.comment = {
                            id: 0,
                            user_id: window.Laravel.user.id,
                            post_id: window.Laravel.post_id,
                            type: window.Laravel.user.role.name,
                            comment: "Comment*",
                            user: window.Laravel.user,
                            commentReplies: []
                        };
                    }
                })
                .catch(error => {
                    console.log("errors : ", error);
                });
        },
        addCommentReply: function(scope) {
            this.$validator.validateAll(scope).then(result => {
                if(result){

                axios
                    .post(
                        window.Laravel.url +
                            "/post/comments/addcommentreply/",
                        this.commentReply
                    )
                    .then(response => {
                        if (response.data.etat) {
                            this.action = 'addCommentReply';
                            var reply = response.data.commentReply;
                            this.comments.forEach(element => {
                                if (element.id == reply.comment_id) {
                                    element.comment_replies.push(reply);
                                }
                            });
                            this.commentReply = {
                                id: 0,
                                user_id: window.Laravel.user.id,
                                type: window.Laravel.user.role.name,
                                comment: "Comment*",
                                comment_id: 1,
                                user: window.Laravel.user
                            };
                            this.commentReply.comment_id = reply.comment_id;
                        }
                    })
                    .catch(error => {
                        console.log("errors : ", error);
                    });
                    
                    return;
                } else{
                    alert("Correct them errors !!");
                }
            });
        },
        updateCommentReply: function(scope) {
            this.$validator.validateAll(scope).then(result => {
                if(result){

                axios
                    .put(
                        window.Laravel.url +
                            "/post/comments/updatecommentreply/",
                        this.commentReply
                    )
                    .then(response => {
                        if (response.data.etat) {
                            this.action = 'updateCommentReply';
                            var reply = this.commentReply;
                        }
                    })
                    .catch(error => {
                        console.log("errors : ", error);
                    });
                    
                    return;
                } else{
                    alert("Correct them errors !!");
                }
            });
        },
        preperCommentReply: function(id) {
            this.action = '';
            this.commentReply = {
                id: 0,
                user_id: window.Laravel.user.id,
                type: window.Laravel.user.role.name,
                comment: "",
                comment_id: 1,
                user: window.Laravel.user
            };
            this.commentReply.comment_id = id;
        },
        preperCommentReplyDelete: function(commentReplie){
            this.commentReply = commentReplie;
            this.action= "";
        },
        deleteCommentReply: function() {
            axios
                .delete(
                    window.Laravel.url +
                        "/post/comments/deletecommentreply/" +
                        this.commentReply.id
                )
                .then(response => {
                    if (response.data.etat) {
                        var reply = this.commentReply;
                        this.comments.forEach(element => {
                            if (element.id == reply.comment_id) {
                                element.comment_replies.splice(
                                    element.comment_replies.indexOf(this.commentReply),
                                    1
                                );
                                this.action= "deleteCommentReply";
                            }
                        });
                        this.action = 'deleteComment';
                    }
                })
                .catch(error => {
                    console.log("errors : ", error);
                });
        },
    },
    mounted: function() {
        this.getComments();
    }
});
