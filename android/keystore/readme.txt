Generate Keystores:
keytool -genkey -v -keystore money.keystore -storepass 123456 -alias money -keypass 123456 -keyalg RSA -keysize 2048 -validity 10000

keytool -genkey -v -keystore money.jks -storepass b@byjumb0 -alias money -keypass b@byjumb0 -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 

Warning: The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using 
"keytool -importkeystore -srckeystore money.keystore -destkeystore money_pkcs12.keystore -deststoretype pkcs12".

keytool -importkeystore -srckeystore money.jks -destkeystore money_pkcs12.jks -deststoretype pkcs12



Get Key Fingerprints:
keytool -list -v -keystore money.keystore -storepass 123456 -alias money -keypass 123456
keytool -list -v -keystore money_pkcs12.keystore -storepass 123456 -alias money -keypass 123456

keytool -list -v -keystore money_pkcs12.jks -storepass b@byjumb0 -alias money -keypass b@byjumb0

for Facebook hash
keytool -exportcert -alias money -storepass 123456 -keystore money.keystore | openssl sha1 -binary | openssl base64