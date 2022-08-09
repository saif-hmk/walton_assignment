package org.aalaa.rnd.ws

import grails.rest.RestfulController
import org.aalaa.auth.AuthUser

//https://jolorenz.wordpress.com/2014/02/28/create-a-restservice-api-with-grails-2-3-x-in-15-minutes/
//https://grails.github.io/grails2-doc/2.5.x/guide/webServices.html
class WsRndController extends RestfulController {

    static responseFormats = ['json', 'xml']

    def index() { }

    WsRndController() {
        super(AuthUser)
    }
}
