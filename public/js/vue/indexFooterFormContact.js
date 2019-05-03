var footerFormContact = new Vue({
    el: "#footerFormContact",
    data: {
        etat:false,
        succes: "",
        contact: {
            email: "",
            message: ""
        }
    },
    methods: {
        addMessage: function() {
            
            this.$validator.validateAll().then(result => {
                if (result) {

                    axios
                    .post(window.Laravel.url + "/home/footerFormContact", this.contact)
                    .then(response => {
                        if (response.data.etat == true) {
                            this.etat = true;
                            this.succes = "Your message is send ";
                            console.log("response : ", response.data);
                            this.contact = {
                                email: "exemple@gmail.com",
                                message: "Write another message her !!"
                            }
                        }
                    })
                    .catch(error => {
                        this.etat = false;
                        this.succes = "Your message doesn't send !!!! <br>try againe ";
                        console.log("errors : ", error);
                    });

                    return;
                }

                alert("Correct them errors!");
            });
        }
    }
});
