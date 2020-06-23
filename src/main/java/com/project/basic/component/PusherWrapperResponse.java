//package com.project.basic.component;
//
//import com.pusher.rest.Pusher;
//import com.pusher.rest.data.Result;
//import lombok.extern.java.Log;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//
//@Component
//@Log
//public class PusherWrapperResponse {
//
//    @Value("${pusher.app.id}")
//    private String appId;
//
//    @Value("${pusher.key}")
//    private String val_pusher_key;
//
//    @Value("${pusher.secret}")
//    private String val_pusher_secret;
//
//    @Value("${pusher.cluster}")
//    private String val_pusher_cluster;
//
//    public PusherWrapperResponse () {
//    }
//
//    public Result setPusherWrapperTrigger (String channel, String eventName, Object data) {
//        Pusher pusher = new Pusher(appId, val_pusher_key, val_pusher_secret);
//        pusher.setCluster(val_pusher_cluster);
//        pusher.setEncrypted(true);
//        return pusher.trigger(channel, eventName, data);
//    }
//}
