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
    settings.idp_slo_target_url             = "https://oauth2id.dev/saml/auth"
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

    # Security section
    settings.security[:authn_requests_signed] = false
    settings.security[:logout_requests_signed] = false
    settings.security[:logout_responses_signed] = false
    settings.security[:metadata_signed] = false
    settings.security[:digest_method] = XMLSecurity::Document::SHA1
    settings.security[:signature_method] = XMLSecurity::Document::RSA_SHA1

    settings
  end
end
