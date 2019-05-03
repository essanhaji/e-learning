
    var coursSingleComment = new Vue({
        el:'#coursSingleComment',
        data:{
            comments:[],
            action: true,
            comment: {
                id:0,
                user_id: 3,
                course_id: window.Laravel.course_id,
                type:"",
                comment:"",
                created_at:"",
                user:{
                    id:0,
                    role_id:0,
                    name:"",
                    email:"",
                    avatar:"",
                    created_at:""
                },
                comment_replies:[]
            },
            comment_reply:{
                id:0,
                user_id: 3,
                course_id: window.Laravel.course_id,
                type:"",
                comment:"",
                comment_id:""
            }
        },
        methods:{
            // dateFormat:function(date){
            //     var dateFormat = require('dateformat');
            //     console.log(date);
            //     return dateFormat(date, "d, mm, y - h:MM:ss");
            // },
            getComments:function(){
                axios.get(window.Laravel.url+'/courses/comments/getcomment/'+this.comment.course_id)
                .then(response => {
                    this.comments = response.data.data;
                    console.log(response.data);
                })
                .catch(error => {
                    console.log('errors : ', error)
                })
            },
        //     preperaddExperience:function(){
        //         this.action = true;
        //         this.experience = {
        //             id:0,
        //             user_id:{{ Auth::user()->id }},
        //             start_date:"",
        //             end_date:"",
        //             title:"",
        //             speciality:"",
        //             description:""
        //         }
        //     },
        //     addExperience:function(){
        //         axios.post(window.Laravel.url+'/candidate/candidate-profile/addExperience', this.experience)
        //         .then(response => {
        //             if(response.data.etat){
        //                 this.experiences.unshift(this.experience);
        //                 this.experience = {
        //                     id:0,
        //                     user_id:{{ Auth::user()->id }},
        //                     start_date:"",
        //                     end_date:"",
        //                     title:"",
        //                     speciality:"",
        //                     description:""
        //                 }
        //             }
        //         })
        //         .catch(error => {
        //             console.log('errors : ', error)
        //         })
        //     },
        //     editExperience:function(experience){
        //         this.action = false;
        //         this.experience = experience;
        //     },
        //     updateExperience:function(){
        //     axios.put(window.Laravel.url+'/candidate/candidate-profile/updateExperience', this.experience)
        //     .then(response => {
        //         if(response.data.etat){
        //             this.action = true; 
        //             this.experience = {
        //                 id:0,
        //                 user_id:{{ Auth::user()->id }},
        //                 start_date:"",
        //                 end_date:"",
        //                 title:"",
        //                 speciality:"",
        //                 description:""
        //             }
        //         }
        //     })
        //     .catch(error => {
        //         console.log('errors : ', error)
        //     })
        // },
        // preperExperience:function(experience){
        //     this.experience = experience;
        // },
        // deleteExperience:function(){
        //     axios.delete(window.Laravel.url+'/candidate/candidate-profile/deleteExperience/'+this.experience.id)
        //     .then(response => {
        //         if(response.data.etat){
        //             this.experiences.splice(this.experiences.indexOf(this.experience), 1);
        //             this.experience = {
        //                 id:0,
        //                 user_id:{{ Auth::user()->id }},
        //                 start_date:"",
        //                 end_date:"",
        //                 title:"",
        //                 speciality:"",
        //                 description:""
        //             }
        //         }
        //     })
        //     .catch(error => {
        //         console.log('errors : ', error)
        //     })
        // }
        },
        mounted: function(){
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