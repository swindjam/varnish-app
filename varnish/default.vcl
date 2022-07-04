vcl 4.1;

backend default {
    .host = "app";
    .port = "8080";
}

backend api {
    .host = "api";
    .port = "1234";
}

sub vcl_recv {
    // Remove cookies to enable caching
    unset req.http.cookie;

    // Setup the backend based on the request
    if(req.url ~ "/esi$") {
        set req.backend_hint = api;
    } else {
        set req.backend_hint = default;
    }
}

sub vcl_backend_response {
    // Enable ESIs
    set beresp.do_esi = true;
    set beresp.ttl = 5m;
}

sub vcl_deliver {
    if(obj.hits > 0) {
        set resp.http.Cache-Status = "HIT";
    } else {
        set resp.http.Cache-Status = "MISS";
    }

    if(obj.ttl >= 0s) {
        set resp.http.Expires = "" + (now + obj.ttl);
    }
}