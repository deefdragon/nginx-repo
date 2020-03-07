local shell = require "resty.shell"
local stdin = ""
local timeout = 1000 -- ms
local max_size = 4096 -- byte


local h, err = ngx.req.get_headers()


local passedSecret = h["X-Hub-Signature"][1]
local secret = os.getenv("NGINX_GITHUB_SECRET")

if nor passedSecret == secret then 
    return
else
    ngx.log(ngx.STDERR, "Hash ok. Reloading.")
end


    shell.run([[ "/etc/nginx/scripts/reload.sh" ]], stdin, timeout, max_size)


