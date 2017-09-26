<template>
    <v-flex xs12 sm8 md6>
        <div>
            <div v-if="validid&&!submitted">
                <div v-if="page==0" class="center">
                    <img class="logo" src="~/assets/logo-262.png">
                    <h2>Bine ai venit</h2>
                    <h4>Hai sa facem cunostinta</h4>
                    <v-form v-model="valid" ref="form0">
                        <v-layout row wrap>
                            <v-flex xs12 sm5>
                                <v-text-field prepend-icon="account_box" label="Prenume" v-model="om.prenume" :rules="nameRules" required></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm5 style="margin-left: 12px">
                                <v-text-field label="Nume" v-model="om.nume" :rules="nameRules" required></v-text-field>
                            </v-flex>
                        </v-layout>
                        <v-text-field label="Numar Telefon" prepend-icon="phone" v-model="om.numar" :rules="nameRules" required></v-text-field>
                        <v-text-field prepend-icon="business" label="Universitate si Facultate" v-model="om.univ" :rules="nameRules" required></v-text-field>
                        <v-text-field prepend-icon="history" label="An" v-model="om.an" :rules="nameRules" required></v-text-field>
                        <!--<v-checkbox label="Do you agree?" v-model="checkbox" :rules="[(v) => !!v || 'You must agree to continue!']" required></v-checkbox>-->

                        <!--<v-btn @click="log">log</v-btn>-->
                    </v-form>
                </div>
                <div v-if="page==1" class="center">
                    <h2>Salut, {{om.prenume}}!</h2>
                    <h4>Hai sa facem cunostinta</h4>
                    <v-form v-model="valid" ref="form1">

                        <v-text-field prepend-icon="link" label="Github URL" v-model="om.github"></v-text-field>
                        <v-text-field prepend-icon="link" label="LinkedIn URL" v-model="om.linkedin"></v-text-field>
                    </v-form>

                </div>
                <div v-if="page==2" class="center">
                    <h4>Povesteste-ne despre experienta ta<br>cu cateva tehnologii si concepte generale de cloud</h4>
                    <v-form v-model="valid" ref="form2">
                        <v-text-field rows="2" multi-line label="Azure" v-model="om.cloud.azure"></v-text-field>
                        <v-text-field rows="2" multi-line label="Multi-Tenancy" v-model="om.cloud.multitenant"></v-text-field>
                        <v-text-field rows="2" multi-line label="Scalability" v-model="om.cloud.scalability"></v-text-field>
                        <v-text-field rows="2" multi-line label="Availability/Performance" v-model="om.cloud.avalperf"></v-text-field>
                        <v-text-field rows="2" multi-line label="Microservices" v-model="om.cloud.microserv"></v-text-field>
                        <v-text-field rows="2" multi-line label="Serverless infrastructure" v-model="om.cloud.infr"></v-text-field>
                    </v-form>

                </div>
                <div v-if="page==3" class="center">
                    <v-form v-model="valid" ref="form3"></v-form>
                    <h4>In continuare, te rugam sa iti acorzi<br>o nota de la 1 la 5 in functie de nivelul tau<br>pentru urmatoarele tehnologii si concepte.</h4>
                </div>
                <div v-if="page==4" class="center">
                    <h2>Dezvoltare si deployment</h2>

                    <v-form v-model="valid" ref="form4">
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>.NET</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.gen.net">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Java</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.gen.java">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Powershell</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.gen.ps">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Node JS</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.gen.node">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-text-field label="Alte limbaje de programare sau scripting" v-model="om.gen.other"></v-text-field>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Git</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.gen.git">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>

                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Docker</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.gen.docker">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>CLI tools</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.gen.cli">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-form>

                </div>
                <div v-if="page==5" class="center">
                    <h2>Tehnologii Web</h2>

                    <v-form v-model="valid" ref="form5">

                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>HTML+CSS</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.web.html">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>JavaScript</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.web.js">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-text-field label="Frontend Frameworks" v-model="om.web.other"></v-text-field>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Web Servers (IIS, Apache, NGINX)</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.web.ws">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>

                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Rest APIs</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.web.rest">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Graph QL</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.web.graph">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Cookies</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.web.cookies">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-form>

                </div>
                <div v-if="page==6" class="center">
                    <h2 style="width: 600px;">Baze de date</h2>

                    <v-form v-model="valid" ref="form6">
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>RDBMS (SQL)</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.db.rdbms">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>NoSQL</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.db.nosql">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Redis</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.db.redis">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>

                    </v-form>

                </div>
                <div v-if="page==7" class="center">
                    <h2 style="width: 600px;">Networking</h2>

                    <v-form v-model="valid" ref="form7">
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>HTTP/HTTPS</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.net.http">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>TCP</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.net.tcp">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>UDP</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.net.udp">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>DNS</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.net.dns">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>DHCP</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.net.dhcp">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>SSH</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.net.ssh">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-form>
                </div>
                <div v-if="page==8" class="center">
                    <h2 style="width: 600px;">Security</h2>

                    <v-form v-model="valid" ref="form8">
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>SSL/TLS</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.sec.ssl">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>Mutual TLS</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.sec.clientcert">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>CORS</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.sec.cors">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                        <v-container grid-list-md text-xs-center>
                            <v-layout row wrap>
                                <v-flex xs8>
                                    <h5>WAF</h5>
                                </v-flex>
                                <v-flex xs4>
                                    <v-btn-toggle exclusive v-model="om.sec.waf">
                                        <v-btn flat>
                                            1
                                        </v-btn>
                                        <v-btn flat>
                                            2
                                        </v-btn>
                                        <v-btn flat>
                                            3
                                        </v-btn>
                                        <v-btn flat>
                                            4
                                        </v-btn>
                                        <v-btn flat>
                                            5
                                        </v-btn>
                                    </v-btn-toggle>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-form>
                </div>
                <div v-if="page==9" class="center">
                    <h2 style="width: 600px;">Esti gata sa trimiti formularul.<br>Asigura-te ca nu ai uitat nimic!</h2>
                </div>
                <v-btn v-if="page>0" @click="prev">Prev</v-btn>
                <v-btn v-if="page<9" @click="next">Next</v-btn>
                <v-btn v-if="page==9" @click="submit">Submit</v-btn>
            </div>
            <div class="center" v-if="!validid">
                <h1>Get outta here with id {{ssrid}}</h1>
            </div>
            <div class="center" v-if="submitted&&state==1">
                <h1>Multumim! Am primit datele tale.</h1>
            </div>
            <div class="center" v-if="submitted&&state==0">
                <h1>Te rugam sa astepti...</h1>
            </div>
            <div class="center" v-if="submitted&&state==2">
                <h1>Ceva nu a mers bine. Incearca din nou cu butonul de mai jos.</h1>
                <h5>Daca ai mai primit mesajul acesta, te rugam sa ne contactezi la adresa: </h5>
                <v-btn @click="submit">Incearca din nou</v-btn>
            </div>
        </div>
    </v-flex>
</template>

<script>
import axios from 'axios'
import Upload from '@/components/Upload'
export default {
    name: "registerform",
    components: { Upload },
    data() {
        return {
            state: 0,
            submitted: false,
            validid: true,
            valid: false,
            page: 7,
            om: {
                prenume: "",
                nume: "",
                numar: "",
                github: "",
                univ: "",
                an: "",
                linkedin: "",
                cloud: {
                    azure: "",
                    multitenant: "",
                    scalability: "",
                    avalperf: "",
                    microserv: "",
                    infr: ""
                },
                gen: {
                    net: 0,
                    java: 0,
                    ps: 0,
                    other: "",
                    docker: 0,
                    git: 0,
                    cli: 0,
                    node: 0,
                    ps: 0
                },
                web: {

                    html: 0,
                    js: 0,
                    rest: 0,
                    graph: 0,
                    cookies: 0,
                    revprox: 0,
                    ws: 0,
                    other: ""

                },
                db: {
                    rdbms: 0,
                    nosql: 0,
                    redis: 0
                },
                net: {
                    http: 0,
                    tcp: 0,
                    udp: 0,
                    ssh: 0,
                    dns: 0,
                    dhcp: 0
                },
                sec: {
                    ssl: 0,
                    clientcert: 0,
                    waf: 0,
                    cors: 0
                }
            },
            nameRules: [
                (v) => !!v || 'Field is required',
            ],
        }
    },

    computed: {
        id() {
            return this.$route.params.id
        },
        formref() {
            return "form" + this.page

        }
    },
    asyncData({ params }) {
        return axios.get(`https://my-api/posts/${params.id}`)
            .then((res) => {
                return { title: res.data.title }
            }, (err) => {
                //return {validid:true,ssrid:params.id}
            })
    },
    methods: {
        next() {
            this.changePage(1, true)
        },
        prev() {
            this.changePage(-1, false)
        },
        changePage(d, val) {
            if (val == true) {
                var x = this.$refs[this.formref].validate()
                if (x == true) {
                    this.valid = false
                    this.page += d

                }
            }
            else this.page += d

        },
        submit() {
            this.page = 10;
            this.submitted = 1;
            this.state = 0;
            axios.post('https://my-api/posts', this.om).then((res) => {
                this.state = 1;
            },
                (err) => {
                    this.state = 2;
                })
        }
    }
}
</script>

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

.center {
    width: 100%;
}

.logo {
    margin-bottom: 60px;
}

.left {
    float: left;
}

.right {
    float: right;
}

h5 {
    text-align: left;
}

</style>


<!--

Nume
Prenume
Universitate
Facultate
Serie/Nr Buletin



-->