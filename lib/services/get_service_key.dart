import 'package:googleapis_auth/auth_io.dart';

class GetServerKey{
  Future<String> getServerKeyToken() async{
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];
    
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
            {
              "type": "service_account",
              "project_id": "easyshopping-d21de",
              "private_key_id": "86249d4a8b98d6453e4379beb9a593ae155e2471",
              "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC7xqDOytOsLK7P\nJozyoM9kpbXT6uyJHS7s6tz5x92ciPhoIuUcDALIM/Fp9Vd8XnH7Ovy8JMICSf/t\neE3OtmBH25ZmLPPCSd4TmRydiBtXzRN5YOO3votSuNqT9J59b/cXj8ijWh2JtNiy\n1sfFqv0D8UYESSdjburN+yITRdJlKM3jUIPJetDtemiseXDIYKNDQueEJVjwASzr\nlqyEFtes+hB9MtQnXeW8sRxmTCsJmPvggAd0h9xNOTxJDqRXfrYj9pfV6jnEia+n\nNuo+QMt1qOPUQzUKFusJLsY6M7UsgCcV1Af5C2d0vElrBZLKpJvs3MPCgAlYrsiJ\no2ycS37lAgMBAAECgf8EwFaF1wgtXBvAoNLGz+XWj7jBeL8i/0Ekld4yopzR9tk7\nI822ketssdhcZ/xganYZ+yCf9E65EAQJxZITDLFti1qrxQnTRC3CG9LJoc6y2BIg\nXnNcE1hjvL+PM6al5zfLGelErePPhYRyn9eOwf3KWq1wuIZCMsgUsCEeeR6tYNz2\nNqoUhW8r7Nmnjr3Jr80xTPpe1L4W+JMFQmeDDgy/3l1EgO1Ue/pM5J2prpL9l1en\nhR4zNMlKafEbpvu4svGGLFJjhsWZ301dWVcDVOG79FWKkO8R7+UkAl7f03HPulKZ\nTVHM2lnICm6arjfOHcEeVPj+VWR+wnm9Nxj+Q88CgYEA5OWHmSZB1KHnF7um6Mk7\n4JEKT9bZs9UlA19smviZammOKzEwr0YkxpY96/b556oiE6CIXAdM/IM8fOXi5yVc\nlctSWY+fl9LfrJQFPMbOdtF42TVL9BjTWYulpd683kIXjp7m2bpI3MqfqVDLtqjr\nMrIdRdBQKYPsb/NXybOhOaMCgYEA0gKekeKI6OPG+N49K18JXvtqOSDDUG3A+PSR\nbGuStlrj+OUnBAtdgufAc4f3Xf64XoMs4QekRf7KV6uEpyIYgIT7kya6ULpbjmLe\nO5EegSPz+hIWSKT8/6tNtZnnJD/JfUIQU69+9kxk3CyN/O0bHYOO7gM1ZBmNxm2D\nrOk6/dcCgYAcX8ebWH64mQlIi9545NkjUVdx5jQ+cqGP9XhFDaQW6NbSy9o5H/zX\nETDD223HJfPrcu70WYNVmf8ZjHXAKYV8nCOtLnyeGWnYvtCXZB2b5QOSCWVM8Pbi\nFsmF8kJ/WroI1/HN86WsmQGJv5ZBIldlhWbTjKsjOlNI3WV4f2fw+QKBgQCmI1ha\nxMHWq8uOuhHeK9L4ByFjjF23VPxiduhMw1VPWdwb3PzeoDccBkcjnp69B3PHoTJx\n21/D1+svLAtHRRvpIEr9gJfIoYUowWJZ8VYWh+DNJl3mnk9f258gWV6YOLYnl4nf\nCmkAZDMuUzkIrHLVCGycMoGcbPLR1XVj5ya6BQKBgQCxqeQByLm8ex/41PmBtNO5\nExioGq4ymWG3nTbDA2N4k+x4jS5waK37tVgM42cvGKEaex9MDGhu6nYzvgBPLOcr\nDGrZY/vt8FQV/dqWhFCdZuffN4Or0BgusSAk4CZzSvVJB6BJ8sXrkh8UsFjREXxO\nxvYOtcau/Rl9HFFGG7q+Yw==\n-----END PRIVATE KEY-----\n",
              "client_email": "firebase-adminsdk-cnjlm@easyshopping-d21de.iam.gserviceaccount.com",
              "client_id": "106496704698299621719",
              "auth_uri": "https://accounts.google.com/o/oauth2/auth",
              "token_uri": "https://oauth2.googleapis.com/token",
              "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
              "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-cnjlm%40easyshopping-d21de.iam.gserviceaccount.com",
              "universe_domain": "googleapis.com"
            }

        ),
        scopes,
    );
    final accessServerKey = client.credentials.accessToken.data;
    return accessServerKey;
  }
}