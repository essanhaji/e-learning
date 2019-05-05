var coursSingleComment = new Vue({
    el: "#coursSingleComment",
    data: {
        comments: [],
        action: false,
        actionDelete:false,
        comment: {
            id: 0,
            user_id: window.Laravel.user.id,
            course_id: window.Laravel.course_id,
            type: window.Laravel.user.role.name,
            comment: "",
            user: window.Laravel.user,
            commentReplies: []
        },
        comment_reply: {
            id: 0,
            user_id: 3,
            course_id: window.Laravel.course_id,
            type: "",
            comment: "",
            comment_id: ""
        }
    },
    methods: {
        // dateFormat:function(date){
        //     var dateFormat = require('dateformat');
        //     console.log(date);
        //     return dateFormat(date, "d, mm, y - h:MM:ss");
        // },
        getComments: function() {
            axios
                .get(
                    window.Laravel.url +
                        "/courses/comments/getcomment/" +
                        window.Laravel.course_id
                )
                .then(response => {
                    this.action = false;
                    this.comments = response.data.data;
                })
                .catch(error => {
                    console.log("errors : ", error);
                });
        },
        addComment: function() {
            this.$validator.validateAll().then(result => {
                if (result) {
                    axios
                        .post(
                            window.Laravel.url +
                                "/courses/comments/addcomment/",
                            this.comment
                        )
                        .then(response => {
                            if (response.data.etat) {
                                this.action = true;
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
        preperComment:function(comment){
            this.action = false;
            this.comment = comment;
        },
        updateComment:function(){
            this.$validator.validateAll().then(result => {
                if (result) {
        axios.put(window.Laravel.url+'/courses/comments/updatecomment', this.comment)
        .then(response => {
            if(response.data.etat){
                this.action = true;
            }
        })
        .catch(error => {
            console.log('errors : ', error)
        });
        return;
            }
            alert("Correct them errors !!");
        });
    },
    deleteComment:function(){
        axios.delete(window.Laravel.url+'/courses/comments/deletecomment/'+this.comment.id)
        .then(response => {
            if(response.data.etat){
                this.comments.splice(this.comments.indexOf(this.comment), 1);
                this.actionDelete = true;
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
            console.log('errors : ', error)
        })
    }
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
