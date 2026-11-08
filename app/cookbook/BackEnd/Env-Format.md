# Estrutura do documento .env

- Colocar as variáveis de ambiente no arquivo .env e mudar para as configurações da sua DB e API Key do Geoapify. 
- NOTA: Em caso de correr o projeto com o .env com a API, é necessário correr com: flutter run --dart-define-from-file=BackEnd/.env --profile lib/main.dart
- Site para obter a API Key do Geoapify: https://www.geoapify.com/ 

DB_HOST = Host
DB_PORT = Port
DB_USER = Username
DB_PASSWORD = Password
DB_NAME = cookbook
DB_CONNECTION_LIMIT = 20

GEOAPIFY_API_KEY = API_KEY