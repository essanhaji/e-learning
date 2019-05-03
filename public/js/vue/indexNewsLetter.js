var newsLetter = new Vue({
    el: "#newsLetter",
    data: {
        action: true,
        succes: "",
        newsletter: {
            email: ""
        }
    },
    methods: {
        addNewsletter: function() {
            this.$validator.validateAll().then(result => {
                if (result) {
                    axios
                    .post(window.Laravel.url + "/home/newsletter", this.newsletter)
                    .then(response => {
                        if (response.data.etat == true) {
                            this.action = false;
                            this.succes = "Newslitter is Enable now";
                            console.log("response : ", response.data);
                        }
                    })
                    .catch(error => {
                        console.log("errors : ", error);
                    });
                    return;
                }

                alert("Correct them errors!");
            });
        }
    }
});
