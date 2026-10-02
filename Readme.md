# Projeto Mobile
## IADE - Engenharia Informática
### 1. Equipa
| Membro| Número de Estudante|
|---|---|
| André Maleitas | 20251381 |
| Guilherme Soares | 20252152 |
| Henrique Metelo | 20252138 |
| Leandro Santos | 20252147 |

---

## 2. Keywords

---

## 3. Descrição da app

O presente projeto consiste no desenvolvimento de uma aplicação orientada para a gestão e partilha de **receitas culinárias**, combinando funcionalidades de interação comunitária com ferramentas de apoio à decisão de compra.

A aplicação foi concebida para permitir a **criação, catalogação e armazenamento personalizado de receitas**, conferindo a cada utilizador a possibilidade de definir a visibilidade dos seus conteúdos através de controlos de privacidade.

No que concerne à vertente social e de interação, o sistema integrará um módulo de gestão de perfis individuais, permitindo explorar receitas publicadas pela comunidade e registar reações a outros conteúdos.

Adicionalmente, a solução incorpora um serviço de geolocalização com mapeamento de superfícies comerciais e a monitorização dos respetivos preços de produtos. Esta componente viabiliza a implementação de um comparador de preços de ingredientes entre diferentes estabelecimentos, capacitando os utilizadores a otimizar o custo das suas refeições de forma prática e informada.

---

## 4. Publico Alvo
A aplicação Cookbook destina-se a um público diversificado, desde entusiastas da culinária até pessoas que procuram otimizar a gestão doméstica e financeira. O público-alvo inclui:

- **Famílias e pessoas com interesse na culinária:** Pessoas que desejam explorar novas receitas, partilhar experiências culinárias e interagir com uma comunidade de entusiastas;

- **Individuos preocupados com a gestão financeira doméstica:** Utilizadores que procuram otimizar os custos das suas refeições, comparando os preços dos ingredientes em diferentes estabelecimentos.

---

## 5. Pesquisa de mercado
Atualmente existem várias aplicações de gestão de receitas que se aproximam da solução proposta, nomeadamente a Paprika, Cookpad, Crouton, Cookidoo e Tasty. Embora cada uma tenha pontos fortes, a análise destas soluções permitiu identificar problemas comuns:

Interface pouco intuitiva: várias das aplicações analisadas apresentam uma UI bastante arcaica o que dificulta a utilização, sobretudo pelos utilizadores que temos definidos como publico-alvo.
Ausência de interação comunitária: a generalidade das aplicações carece de mecanismos sociais, como perfis, partilha e reações a conteúdos de outros utilizadores e a habilidade de "seguir" os mesmos.
Inexistência de apoio à decisão de compra: nenhuma das aplicações analisadas integra a comparação de preços de ingredientes entre estabelecimentos, o que impede o utilizador de otimizar o custo das suas refeições.

A aplicação Cookbook procura preencher estas lacunas com uma interface intuitiva,com uma vertente social ativa e uma ferramenta de comparação de preços, posicionando-se assim como uma alternativa mais completa as outras aplicações no mercado e adaptada às necessidades dos seus utilizadores.

---

## 6. Versao Preliminar

**1º Guiao** - ***Funcionalidade Core*** - Inserir uma receita na aplicaçao

**Objetivo** - O Utilizador Criar uma nova receita no seu perfil

**Ator** - Utilizador Autenticado

**pré requisitos** - o utilizador **precisa de ter uma conta e estar autenticado**
 - 1. O Utilizador acede ao ecrã inicial e carrega "Criar nova receita".
 - 2. O sistema abre um novo ecrã para o utilizador escolher os ingredientes.
 - 3. O sistema abre um novo ecrã para o utilizador escrever passo a passo a receita.
 - 4. Por fim abre um novo ecrã para o utilizador dar detalhes a receita(nome, tempo, dieta, privacidade, imagens ou videos)
 - 5. O utilizador carrega no botão "criar"
 - 6. O sistema da uma mensagem de confirmação da criação
---

## 7. Motivação e Identificação do Problema

No contexto socioeconómico atual, a gestão do orçamento e dos recursos domésticos constitui um desafio diário para a maioria das famílias. Este projeto aborda diretamente três problemáticas centrais:

* **Gestão Ineficiente de Ingredientes e Desperdício Alimentar:** A ausência de um planeamento estruturado das refeições conduz frequentemente à aquisição redundante de produtos e ao posterior descarte de alimentos não consumidos dentro do prazo de validade, agravando o desperdício doméstico.
* **Pressão Financeira e Dispersão de Preços:** O aumento generalizado dos bens essenciais exige uma monitorização cuidada dos gastos. Contudo, a opacidade e a constante variação de preços entre diferentes cadeias de distribuição tornam a procura pelas opções mais económicas uma tarefa complexa e morosa para o consumidor.
* **Monotonia Alimentar e Falta de Inspiração:** O ritmo quotidiano restringe frequentemente o tempo dedicado à conceção de ementas variadas e equilibradas, resultando na repetição sistemática das mesmas refeições ou no recurso a soluções pré-confecionadas, menos saudáveis e mais dispendiosas.

---

## 8. Proposta de Valor e Objetivos

Como resposta a estes desafios, a plataforma consolida uma abordagem integrada assente em três vetores estratégicos:

1. **Otimização da Economia Doméstica:** Apoiar ativamente as famílias na redução das despesas correntes, identificando as superfícies comerciais mais vantajosas para a aquisição do conjunto exato de ingredientes exigidos por cada refeição.
2. **Sustentabilidade e Gestão Racional:** Fomentar o aproveitamento consciente dos recursos alimentares disponíveis no domicílio, minimizando compras desnecessárias e combatendo o desperdício.
3. **Inovação e Inspiração Culinária:** Disponibilizar uma base de conhecimento colaborativa e dinâmica que estimula a experimentação gastronómica, simplificando o processo de planeamento semanal através de sugestões adaptadas às preferências e ao orçamento de cada utilizador.

---

### 9. Enquadramento nas UCs

| UC | Professor |  |
|---|---|---|
| Projeto de Desenvolvimento Móvel| Fábio Silva | Planeamento e desenvolvimento do projeto |
|Base de Dados| Miguel Boavida | Criaçao e utilização da base de dados |
|Programação de Dispositivos Móveis| João Monge | Desenvolvimento da Interface na aplicação móvel |
| Redes e Comunicação de Dados| Nathan Campos | Desenvolvimento do Back-end da aplicação |
|Matematica Discreta| André Torcato | Analise de dados com conceitos Matemáticos |

---

### 10. Requisitos tecnicos
#### Funcionais
- O sistema deve permitir a criação de contas de utilizador com autenticação segura.
- O sistema deve permitir a criação, edição e eliminação de receitas culinárias.
- O sistema deve permitir a pesquisa e filtragem de receitas com base em critérios como ingredientes, tempo de preparação e tipo de dieta.
- O sistema deve permitir a partilha de receitas com outros utilizadores ou manter receitas privadas.
- O sistema deve utilizar uma API para obter informações sobre preços de produtos em diferentes lojas.
- O sistema deve utilizar uma base de dados para armazenar informações sobre utilizadores, receitas e preços de produtos.
- O sistema deve permitir os utilizadores a dar feedback sobre as receitas, incluindo avaliações, comentários, likes e favoritos.


#### Não Funcionais
- O sistema deve ser responsivo e compatível com diferentes dispositivos móveis.
- O sistema deve garantir a segurança dos dados do utilizador, incluindo informações pessoais e receitas.

---

### 11. Arquitetura provisoria
---

### 12. Tecnologias provisorias

| Função | Tecnologia |
|---|---|
| aplicaçao mobile | flutter, dart |
| Back-end ||
| Base de Dados | MySql, MAMP |

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white) ![Node.js](https://img.shields.io/badge/Node.js-339933?logo=nodedotjs&logoColor=white) ![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white) ![MAMP](https://img.shields.io/badge/MAMP-02749C?logo=mamp&logoColor=white)
---

## 13. planeamento e calendarização

| Entrega | Data | Conteúdo |
|---|---|---|
| Primeira Entrega | 02 October 2026 | Relatorio da proposta do projeto, Mockups, Requisitos |
| Segunda Entrega | 6 Novembro 2026 | Prototipo funcional com BD e servidor, Relatorio atualizado |
| Terceira Entrega | 11 Dezembro 2026 | Versão final do projeto, relatorio e suportes visuais |

---
## 14. Conclusao

---

## bibliografia
