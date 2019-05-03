var coursSingleAddQuestion = new Vue({
    el: "#exampleModalCenterQuestion",
    data: {
        etat:false,
        succes: "",
        question: {
            email: "",
            question: "",
            full_name:"",
            course_id: window.Laravel.course_id
        }
    },
    methods: {
        addQuestion: function() {

            this.$validator.validateAll().then(result => {
                if (result) {

                    axios
                    .post(window.Laravel.url + "/courses/cours-single/addquestion", this.question)
                    .then(response => {
                        if (response.data.etat == true) {
                            this.etat = true;
                            this.succes = "Your question is sended ";
                            console.log("response : ", response.data);
                            this.question = {
                                email: "exemple@gmail.com",
                                question: "Write another question her !!",
                                full_name: "your full name",
                                course_id: window.Laravel.course_id
                            }
                        }
                    })
                    .catch(error => {
                        this.etat = false;
                        this.succes = "Your guestion doesn't send !!!! <br>try againe ";
                        console.log("errors : ", error);
                    });

                    return;
                }

                alert("Correct them errors !!");
            });
        }
    }
});
