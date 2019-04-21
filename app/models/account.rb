class Account < ActiveRecord::Base
  def self.get_saml_settings(url_base)
    # this is just for testing purposes.
    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = OneLogin::RubySaml::Settings.new

    url_base ||= "http://localhost:3000"

    # Example settings data, replace this values!

    # When disabled, saml validation errors will raise an exception.
    settings.soft = true

    # SP section
    settings.issuer                         = url_base + "/saml/metadata"
    settings.assertion_consumer_service_url = url_base + "/saml/acs"
    settings.assertion_consumer_logout_service_url = url_base + "/saml/logout"

    # IdP section
    settings.idp_entity_id                  = "https://oauth2id.dev/saml/auth"
    settings.idp_sso_target_url             = "https://oauth2id.dev/saml/auth"
    settings.idp_slo_target_url             = "https://oauth2id.dev/saml/logout"
    settings.idp_cert                       = "-----BEGIN CERTIFICATE-----
MIIDVjCCAj4CCQCezR+RpTpSaTANBgkqhkiG9w0BAQsFADBtMQswCQYDVQQGEwJD
TjERMA8GA1UECAwIU2hhbmdoYWkxETAPBgNVBAoMCG9hdXRoMmlkMRUwEwYDVQQD
DAxvYXV0aDJpZC5kZXYxITAfBgkqhkiG9w0BCQEWEmVyaWNAY2xvdWQtbWVzLmNv
bTAeFw0xOTA0MTgwNTM3MjJaFw0yOTA0MTUwNTM3MjJaMG0xCzAJBgNVBAYTAkNO
MREwDwYDVQQIDAhTaGFuZ2hhaTERMA8GA1UECgwIb2F1dGgyaWQxFTATBgNVBAMM
DG9hdXRoMmlkLmRldjEhMB8GCSqGSIb3DQEJARYSZXJpY0BjbG91ZC1tZXMuY29t
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0S2yWcJ1Yazw+S0P3uS7
LpbhxHJZ2pOHjxmjw9Fydl7iaYLw5MlpOtFY5Ar5iTjeGO+njm4kSpLA8c4W3E54
CEJ7TOlCGy6v9dCRviZURxxQqn2wN49lQc4Or3jtOLfXCS9esbvKOLdswlEcIYYV
FwRr2hSf5C3YjXO+2+tHFiZ/K+DfqPbSoK35aA7KxiQzd/tRUjy/eAdoYiCWLjIU
QUkRSqZo3B8NDgl1yAtYDgFtP0DccSxrB1rRGFrr5vVe9/JZ99eFb7rfp63D2oTJ
uk2SvHWyK+z2l9k4VNiZRQWiLC9OlaHuQ6qMpqj4acURrvDFcUHECNXPf9Km838T
mwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCOzXzkWIV7ATaQoqqChKoPEgHtRX2P
Jth0adLqiMENY723nv7ZwppaaD+1r4yczf9Pm1LIY504MvMySqQFUTVqprQYL8ZD
8cUS4V0qJ/s8vcg/om3adZ2seDiZUQgw8f4khuIfQwNzmuSGX3xMYYA6y48ndRHC
I2B5sKGHFOU4aWfKJOzPhG+Xrz9/uWyoUOW7JIR1YE4EWph3LagLJ73xmChY7sm9
LvdIRDn3i/kyplZJk5oqTEWBSc8ViOa4ndv4OqHCD1MnFolQEMvERrWZ5J58Vlwv
8ZFJWbWysncnPA9iyKno1wjS9T5eCWgxJgJYcXhG13JdCca4uq7oez2n
-----END CERTIFICATE-----
"


    # or settings.idp_cert_fingerprint           = ""
    #    settings.idp_cert_fingerprint_algorithm = XMLSecurity::Document::SHA1

    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

    settings.certificate = "-----BEGIN CERTIFICATE-----
MIIC6jCCAdICCQDh8J4IsECe2jANBgkqhkiG9w0BAQUFADA3MQswCQYDVQQGEwJD
TjERMA8GA1UECAwIU2hhbmdoYWkxFTATBgNVBAsMDFNBTUwgRXhhbXBsZTAeFw0x
OTA0MjAwMjI2MTZaFw0yOTA0MTcwMjI2MTZaMDcxCzAJBgNVBAYTAkNOMREwDwYD
VQQIDAhTaGFuZ2hhaTEVMBMGA1UECwwMU0FNTCBFeGFtcGxlMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3AE29HdR7lXPkzTYIKQYGTnpfW8VxGH6qRRs
1diMqV1eZuTvKOuW1humU9SJV5CR6ErlTQTVrNm9T6f722ycjizd8im8SVBLcBVV
DcbhGHeOqX5hXO7JMCxg6BZlt3LYqtxjEvBAew4qNGLQb2QaS6ZOEFLjasdOuee/
GJKsrZclEe1Mq8uKatTzrTYi7pQ+zbBZweGh87CCT9G8BMB9HL9iXpi+TgLR5mpx
91Xgftfa0fhW5nPJZDE0QMMMtS3TR5UbIwKwiZ+BSLD+VpJsro+fpHKhB4+OgSs4
54zzZRflHnWfRylmvqAQQz0M8V19FgssSq4MdEHED/tykaEn+wIDAQABMA0GCSqG
SIb3DQEBBQUAA4IBAQBBu4p5qh/FsPOwGMYquqA9igZgfC6v1jz3kLO9ZloU2sNp
tJciLOMqjAf3GR5L5qXLHIcT58+/SNvnHPosWh7yAWNJFpbXGNOmRXHnZZhHlrls
G3IFBm2Ka+cmvN98QJh/MB/FQwiFg0Yk3+gSQ4jEYPuJXboKqQ8V/U8x4NBQp8E6
EnaO+o6SQXrKTPt1wOPuWHqnal/i6+qIpswbifsKvwaj0xzFPPQSOgfb3CZI/Xh0
0pVrX23mPowru7ueuQtfaOWG3b0bKQfBtfvINHd0tOCeWf6N1IFolLzPzsZ+1fCk
4PxCR3nvadukCgneDxpZL0wzw4FvM0lMhkIUuWWD
-----END CERTIFICATE-----
"
    settings.private_key = "-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDcATb0d1HuVc+T
NNggpBgZOel9bxXEYfqpFGzV2IypXV5m5O8o65bWG6ZT1IlXkJHoSuVNBNWs2b1P
p/vbbJyOLN3yKbxJUEtwFVUNxuEYd46pfmFc7skwLGDoFmW3ctiq3GMS8EB7Dio0
YtBvZBpLpk4QUuNqx065578YkqytlyUR7Uyry4pq1POtNiLulD7NsFnB4aHzsIJP
0bwEwH0cv2JemL5OAtHmanH3VeB+19rR+Fbmc8lkMTRAwwy1LdNHlRsjArCJn4FI
sP5Wkmyuj5+kcqEHj46BKzjnjPNlF+UedZ9HKWa+oBBDPQzxXX0WCyxKrgx0QcQP
+3KRoSf7AgMBAAECggEAWFTghKz3p1Kqwfbgo9JenppC5grY2X1hT8uUmxOT/lgv
k+5tG6fjatm1IUlfT1oLSxHvGMpNJFZUDQxsMcBc5zSadCVPpLvpXfoiqSJltBYk
oGbOnqp8+quGyQhdFJe26HsOCEeQDBg218uo1mCBskf2ZdVx26hkMn4amrohPJyI
8TzDg3lk/9k24i4rGs/olbPR3icJvRUDfv66Yk6E87g3eyvpTvgJCs+gsH35rjJ4
vgDNf0W7BdIrvF+fJeAZq1W9DcFy4ha46qhm2/npTKQhRYETbqY5CHELoKwgyfKU
BgxCUF0VyGibIyQTZ/g9AoBmhjzBAk7YCNYlM2g6SQKBgQD7bUATyAor8AQrb9dP
RbJr7ss8TxeIFGp55UGYRgMQcqtLiMW/juZEu7d8NaIdavNgUtusTAGjMQ0iB945
OcB6u/r9Hyxch3TeMstGwi1H7TzQyW0HYTZJr7ZP3qyNmzxDa08Ji0g59Be6UxYu
l/MctmvBRyxGHkPs3gkk9o8oxwKBgQDgAaZvDILa/VGWYmONZZYWzXTlFCL6ERkt
KaiTRMScmNPHQfpfoR+RPCp3bwmyZoUJjC63+GMf7czaz2OFrxh5Z9+APAb3k9Lf
FK2YU4spdWnT6JIvcM2wgxkqM9UleBnvx2dgcSMlZunJPUMWT2rkbZ5qaf1mLuvU
LqWH74YbLQKBgFwcuF8G6IMUWdK4FL+cHzPftmGP8GUQZbnmvdNVwwWhnRP9NcVq
Sv5fb2d4Fr6EUkm10XkcF3V8IP2YuFdqyxOsDtXxN8VmcvB813BC72fsiF1Njj4n
5UW1tCsqvzjZ6IgipkAu4PUqcg73JadIT+7y/iM/Of8uU2BSMDN0iRo9AoGARQbd
JY0iaZ7z3DZ3XOP36xDmu4yH9qz8KBmVM8RWHbdOUzF2mK9KzfNPVrxlrY6/4iBL
aS9mRDmADdEoZtJ85TRn/9j/gJ0RtuJlV/IuiNkAgmdBXNMS3xiW0ZVlUgV/YI7+
wQ47+VOMKRHysVZJpxhMX5hHmIxO6XRyV8AsgAUCgYA7S8KysT/P49Sa1JQHi75p
mfoFVVUj93uT7h9aZheeF0aUdmHde4Nen2bPNy6ODrm81hZkFPB8xPOFkxaJhKSm
7LGcX5/SGVc3Mhm2memRxFe/OK4rIe/acnOkxBkXgjA/N6SPpQAxJ0N6qq7Ktaaj
d8qEMp/H4mhBakpcL4eRyA==
-----END PRIVATE KEY-----
"

    # Security section
    settings.security[:authn_requests_signed] = true
    settings.security[:logout_requests_signed] = true
    settings.security[:logout_responses_signed] = true
    settings.security[:metadata_signed] = true
    settings.security[:digest_method] = XMLSecurity::Document::SHA1
    settings.security[:signature_method] = XMLSecurity::Document::RSA_SHA1

    settings
  end
end
