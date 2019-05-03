    var app2 = new Vue({
        el:'#experience',
        data:{
            experiences:[],
            action: true,
            experience: {
                id:0,
                user_id:{{ Auth::user()->id }},
                start_date:"",
                end_date:"",
                title:"",
                speciality:"",
                description:""
            }
        },
        methods:{
            getExperience:function(){
                axios.get(window.Laravel.url+'/candidate/candidate-profile/getExperience')
                .then(response => {
                    this.experiences = response.data;
                })
                .catch(error => {
                    console.log('errors : ', error)
                })
            },
            preperaddExperience:function(){
                this.action = true;
                this.experience = {
                    id:0,
                    user_id:{{ Auth::user()->id }},
                    start_date:"",
                    end_date:"",
                    title:"",
                    speciality:"",
                    description:""
                }
            },
            addExperience:function(){
                axios.post(window.Laravel.url+'/candidate/candidate-profile/addExperience', this.experience)
                .then(response => {
                    if(response.data.etat){
                        this.experiences.unshift(this.experience);
                        this.experience = {
                            id:0,
                            user_id:{{ Auth::user()->id }},
                            start_date:"",
                            end_date:"",
                            title:"",
                            speciality:"",
                            description:""
                        }
                    }
                })
                .catch(error => {
                    console.log('errors : ', error)
                })
            },
            editExperience:function(experience){
                this.action = false;
                this.experience = experience;
            },
            updateExperience:function(){
            axios.put(window.Laravel.url+'/candidate/candidate-profile/updateExperience', this.experience)
            .then(response => {
                if(response.data.etat){
                    this.action = true; 
                    this.experience = {
                        id:0,
                        user_id:{{ Auth::user()->id }},
                        start_date:"",
                        end_date:"",
                        title:"",
                        speciality:"",
                        description:""
                    }
                }
            })
            .catch(error => {
                console.log('errors : ', error)
            })
        },
        preperExperience:function(experience){
            this.experience = experience;
        },
        deleteExperience:function(){
            axios.delete(window.Laravel.url+'/candidate/candidate-profile/deleteExperience/'+this.experience.id)
            .then(response => {
                if(response.data.etat){
                    this.experiences.splice(this.experiences.indexOf(this.experience), 1);
                    this.experience = {
                        id:0,
                        user_id:{{ Auth::user()->id }},
                        start_date:"",
                        end_date:"",
                        title:"",
                        speciality:"",
                        description:""
                    }
                }
            })
            .catch(error => {
                console.log('errors : ', error)
            })
        }
        },
        mounted: function(){
            this.getExperience();
        }
    });
