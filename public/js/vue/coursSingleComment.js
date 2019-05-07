var coursSingleComment = new Vue({
    el: "#coursSingleComment",
    data: {
        comments: [],
        action: '',
        actionDelete: false,
        actionAddReply: false,
        comment: {
            id: 0,
            user_id: window.Laravel.user.id,
            course_id: window.Laravel.course_id,
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
        // dateFormat:function(date){
        //     var dateFormat = require('dateformat');
        //     console.log(date);
        //     return dateFormat(date, "d, mm, y - h:MM:ss");
        // },
        nbrComments: function(paams) {
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
                        "/courses/comments/getcomment/" +
                        window.Laravel.course_id
                )
                .then(response => {
                    this.action = '';
                    this.comments = response.data.data;
                })
                .catch(error => {
                    console.log("errors : ", error);
                });
        },
        addComment: function() {
            this.$validator.validateAll().then(result => {
                if (result) {
                    this.$validator.reset();

                    axios
                        .post(
                            window.Laravel.url +
                                "/courses/comments/addcomment/",
                            this.comment
                        )
                        .then(response => {
                            if (response.data.etat) {
                                this.action = 'addComment';
                                this.comments.unshift(response.data.comment);
                                this.comment = {
                                    id: 0,
                                    user_id: window.Laravel.user.id,
                                    course_id: window.Laravel.course_id,
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
                course_id: window.Laravel.course_id,
                type: window.Laravel.user.role.name,
                comment: "Comment*",
                user: window.Laravel.user,
                commentReplies: []
            };
        },
        updateComment: function() {
            this.$validator.validateAll().then(result => {
                if (result) {
                    this.$validator.reset();

                    axios
                        .put(
                            window.Laravel.url +
                                "/courses/comments/updatecomment",
                            this.comment
                        )
                        .then(response => {
                            if (response.data.etat) {
                                this.action = 'updateComment';
                                this.comment = {
                                    id: 0,
                                    user_id: window.Laravel.user.id,
                                    course_id: window.Laravel.course_id,
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
        deleteComment: function() {
            axios
                .delete(
                    window.Laravel.url +
                        "/courses/comments/deletecomment/" +
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
                            course_id: window.Laravel.course_id,
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
        addCommentReply: function() {
            this.$validator.validateAll().then(result => {
                if(result){
                this.$validator.reset();

                axios
                    .post(
                        window.Laravel.url +
                            "/courses/comments/addcommentreply/",
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
        updateCommentReply: function() {
            this.$validator.validateAll().then(result => {
                if(result){
                this.$validator.reset();

                axios
                    .put(
                        window.Laravel.url +
                            "/courses/comments/updatecommentreply/",
                        this.commentReply
                    )
                    .then(response => {
                        if (response.data.etat) {
                            this.action = 'updateCommentReply';
                            var reply = this.commentReply;
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
            this.comment = {
                id: 0,
                user_id: window.Laravel.user.id,
                course_id: window.Laravel.course_id,
                type: window.Laravel.user.role.name,
                comment: "Comment*",
                user: window.Laravel.user,
                commentReplies: []
            };
        },
        preperCommentReplyDelete: function(commentReplie){
            this.commentReply = commentReplie;
            this.action= "";
            this.comment = {
                id: 0,
                user_id: window.Laravel.user.id,
                course_id: window.Laravel.course_id,
                type: window.Laravel.user.role.name,
                comment: "Comment*",
                user: window.Laravel.user,
                commentReplies: []
            };
        },
        deleteCommentReply: function() {
            axios
                .delete(
                    window.Laravel.url +
                        "/courses/comments/deletecommentreply/" +
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
                        this.comment = {
                            id: 0,
                            user_id: window.Laravel.user.id,
                            course_id: window.Laravel.course_id,
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
    },
    mounted: function() {
        this.getComments();
    }
});

// var coursSingleComment = new Vue({
//     el: "#coursSingleComment",
//     data: {
//         etat:false,
//         succes: "",
//         comment: {
//             type: "",
//             comment: "",
//             user_id:window.Laravel.user_id,
//             course_id: window.Laravel.course_id
//         }
//     },
//     methods: {
//         addQuestion: function() {

//             this.$validator.validateAll().then(result => {
//                 if (result) {

//                     axios
//                     .post(window.Laravel.url + "/courses/cours-single/addquestion", this.question)
//                     .then(response => {
//                         if (response.data.etat == true) {
//                             this.etat = true;
//                             this.succes = "Your question is sended ";
//                             console.log("response : ", response.data);
//                             this.question = {
//                                 email: "exemple@gmail.com",
//                                 question: "Write another question her !!",
//                                 full_name: "your full name",
//                             }
//                         }
//                     })
//                     .catch(error => {
//                         this.etat = false;
//                         this.succes = "Your guestion doesn't send !!!! <br>try againe ";
//                         console.log("errors : ", error);
//                     });

//                     return;
//                 }

//                 alert("Correct them errors !!");
//             });
//         }
//     }
// });
