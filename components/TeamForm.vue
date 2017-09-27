<template>

    <div>
        <div class="center" v-if="!team&&!final">

            <img src="~/assets/logo.png">
            <h3 class="logo-title"><span class="smarthack">(Smarthack)</span><span class="azure">^Azure</span></h3>
            <h5>Inscrie-ti echipa</h5>
            <v-form v-model="valid" ref="form">
                <v-text-field label="Numele echipei" v-model="name" :rules="nameRules" v-on:input="trustName" required></v-text-field>
                <!--<v-checkbox label="Do you agree?" v-model="checkbox" :rules="[(v) => !!v || 'You must agree to continue!']" required></v-checkbox>-->
                <v-btn v-bind:disabled="disabled" @click="submit">Continua</v-btn>
            </v-form>
        </div>
        <div class="center" v-if="team&&!final">
            <h4>Adauga intre 3 si 4 membri pentru echipa {{team}}</h4>
            <v-form v-model="valid" ref="formem">
                <v-text-field label="Adresa de email" v-model="email[0]" :rules="emailReqRules" required></v-text-field>
                <v-text-field label="Adresa de email" v-model="email[1]" :rules="emailReqRules" required></v-text-field>
                <v-text-field label="Adresa de email" v-model="email[2]" :rules="emailReqRules" required></v-text-field>
                <v-text-field label="Adresa de email (Optional)" v-model="email[3]" :rules="emailRules"></v-text-field>
                <v-btn @click="submitem(true)">Trimite</v-btn>
            </v-form>
        </div>
        <div class="center" v-if="final">
            <h1 v-if="state==0">Se creaza echipa...</h1>
        </div>
        <div class="center" v-if="final&&state==1">
            <h1 class="final-message" >Echipa <span class="final-team">{{team}}</span> a fost creata. Verificati-va casutele de email.</h1>
        </div>
        <div class="center" v-if="final&&state==2">
                <h1>Ceva nu a mers bine. Incearca din nou cu butonul de mai jos.</h1>
                <h5>Daca ai mai primit mesajul acesta, te rugam sa ne contactezi la adresa: <a href="mailto:asmi.unibuc@gmail.com">asmi.unibuc@gmail.com</a></h5>
                <v-btn @click="submitem(false)">Incearca din nou</v-btn>
            </div>
    </div>
</template>

<script>
import _ from 'lodash'
import axios from 'axios'
export default {
    name: 'hello',
    data() {
        return {
            team: undefined,
            valid: false,
            validem: false,
            name: '',
            nameRules: [
                (v) => !!v || 'Numele echipei este necesar',
                (v) => v && v.length > 2 || 'Numele echipei trebuie sa contina cel putin trei caractere',
                (v) => v && !!this.validName || 'Acest nume este deja luat',
                (v) => /^[a-zA-Z0-9 ]*$/.test(v) || 'Numele echipei nu poate contine caractere speciale'
            ],
            checkbox: false,
            validName: true,
            nameChecked: false,
            emailRules: [
                (v) => /^$|^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(v) || 'Adresa de email trebuie sa fie valida'
            ],
            emailReqRules: [
                (v) => !!v || 'Adresa de email este necesara',
                (v) => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(v) || 'Adresa de email trebuie sa fie valida'
            ],
            email: ["", "", "", ""],
            final: false,
            state: 0
        }
    },
    computed: {
        disabled() {
            return !(this.nameChecked && this.validName)
        },
        fullTeam() {
            return {
                TeamName: btoa(this.team),
                members: this.email
            }
        }
    },
    methods: {
        log() {
            console.log(this.$store)
        },
        submitem(validate) {
            if(validate==true)
            var x = this.$refs.formem.validate()
            else var x = true
            this.state=0
            this.final = true;
            if (x == true ) {
                axios.post('https://smarthack.azurewebsites.net/team', this.fullTeam).then(res => {
                    this.state = 1;
                },
                (err)=> {
                    this.state = 2;
                })
            }
        },
        submit() {
            var x = this.$refs.form.validate()
            if (x == true) {
                this.team = this.name
                this.valid = false
            }
        },
        clear() {
            this.final = true;
            this.state = 1;
            this.team = "The Funky Socks"
        },
        trustName() {
            this.validName = true
            this.nameChecked = false
            this.$refs.form.validate()
            this.debounceInput()
        },
        debounceInput: _.debounce(function(e) {
            var res = axios.post('https://smarthack.azurewebsites.net/api/CheckTeamName', { TeamName: this.name }).then(res => {
                this.validName = (res.data == "true")
                this.nameChecked = true
                this.$refs.form.validate()
            })
        }, 500)
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
    font-weight: normal;
}

ul {
    list-style-type: none;
    padding: 0;
}

li {
    display: inline-block;
    margin: 0 10px;
}

a {
    color: #42b983;
}

.final-message {
    font-weight: 300;
}

.final-team {
    font-weight: 400;
}

.smarthack {
    color: #354d7d;
    text-transform: uppercase;
    font-family: 'Lato', sans-serif;
}

.azure {
    color: #0079d6;
    font-family: 'Segoe UI', sans-serif;
}

.logo-title {
    margin-top: 5px;
    margin-bottom: 80px;
}
</style>
