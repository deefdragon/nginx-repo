local shell = require "resty.shell"
local stdin = ""
local timeout = 1000 -- ms
local max_size = 4096 -- byte

ngx.req.read_body()
local h, err = ngx.req.get_headers()


ngx.log(ngx.STDERR, "ERROR: ", err)

for k, v in pairs(h) do
    ngx.log(ngx.STDERR, "HEADER: ", k, " VALUE: ", v)    
end



local passedSecret = h["X-Hub-Signature"][1]
local secret = os.getenv("NGINX_GITHUB_SECRET")

if not passedSecret == secret then 
    ngx.log(ngx.STDERR, "Invalid secret.")
    return
else
    ngx.log(ngx.STDERR, "Secret valid. Reloading.")
end

shell.run([[ "/etc/nginx/scripts/reload.sh" ]], stdin, timeout, max_size)


