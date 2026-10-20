# Relatorio de interfaces e usabilidade 

## Iade - Licenciatura de Engenharia Informática

## Grupo 3 

| Membro| Número de Estudante|
|---|---|
| André Maleitas | 20251381 |
| Guilherme Soares | 20252152 |
| Henrique Metelo | 20252138 |
| Leandro Santos | 20252147 |

# Background

## Descrição 

O quê?:
A aplicação é um livro de receitas digital colaborativo e gestor de despensa para dispositivos móveis. A plataforma permite aos utilizadores organizar receitas pessoais e familiares, planear refeições semanais de forma eficiente e interagir através de uma comunidade ativa focada na partilha de receitas práticas e truques de reaproveitamento.

Porquê?:
Surge da necessidade diária que muitas famílias e jovens têm em gerir as suas rotinas alimentares com pouco tempo disponível, associada ao problema crítico do desperdício alimentar doméstico. Grande parte deste desperdício resulta da ausência de planeamento das compras e do desconhecimento sobre como combinar e rentabilizar os ingredientes já disponíveis em casa antes do fim da validade.

## Visão

Objetivo Ideal:
O objetivo do CookBook é ser a aplicação de referência para o dia a dia na cozinha, juntando num só sítio o planeamento das refeições, a partilha de receitas e a ajuda nas compras de supermercado de forma simples e intuitiva.

Benefícios para o Público-Alvo (Famílias e Jovens):

Poupança e Menos Desperdício: Ajuda a aproveitar os ingredientes que já existem em casa antes de se estragarem e a comprar apenas o necessário.

Menos Stress no Dia a Dia: Acaba com a dúvida do "o que fazer para o jantar?", dando sugestões rápidas e variadas para a rotina diária.

Comunidade e Partilha: Permite descobrir novas ideias, guardar os pratos favoritos e trocar dicas úteis com outros utilizadores.

## Concorrência

Atualmente existem várias aplicações de gestão de receitas que se aproximam da solução proposta, nomeadamente a Paprika, Cookpad, Crouton, Cookidoo e Tasty. Embora cada uma tenha pontos fortes, a análise destas soluções permitiu identificar problemas comuns:

Interface pouco intuitiva: várias das aplicações analisadas apresentam uma UI bastante arcaica o que dificulta a utilização, sobretudo pelos utilizadores que temos definidos como publico-alvo. Ausência de interação comunitária: a generalidade das aplicações carece de mecanismos sociais, como perfis, partilha e reações a conteúdos de outros utilizadores e a habilidade de "seguir" os mesmos.

A aplicação Cookbook visa preencher estas lacunas, oferecendo uma interface intuitiva e uma componente social ativa, através de uma comunidade amigável e interativa. Esta permite aos utilizadores partilhar receitas e reagir aos conteúdos de outros utilizadores, proporcionando uma experiência mais rica e envolvente.

A componente social da aplicação distingue-nos da concorrência.

# Pesquisa do Utilizador

## Método
Para compreender os hábitos e as necessidades do público-alvo, realizámos um inquérito através do Google Forms, que obteve 84 respostas[cite: 1]. Escolhemos este método por permitir recolher, em pouco tempo, dados de um número considerável de pessoas e identificar padrões de comportamento relacionados com a cozinha, o planeamento de refeições, o desperdício alimentar e a utilização de aplicações[cite: 1].

## Perfil dos Participantes
A análise das respostas permitiu perceber que o utilizador-alvo da aplicação são pessoas com idades maioritariamente entre os 48 e os 60 anos (destacando-se a faixa dos 50 anos com 19% dos inquiridos), que cozinham quase todos os dias (59% dos inquiridos)[cite: 1]. Trata-se, portanto, de um público com rotinas de cozinha bem estabelecidas e para quem a preparação de refeições é uma tarefa diária[cite: 1].

![Gráfico - Qual a sua idade? (Distribuição por idades)](grafico_distribuicao_idades.png)

## Principais Resultados

* **Falta de Inspiração:** A principal dificuldade apontada pelos inquiridos é a falta de ideias sobre o que cozinhar (51,2%)[cite: 1, 2]. Apesar de cozinharem com frequência, sentem dificuldade em variar as refeições, o que reforça a necessidade de uma aplicação como o CookBook[cite: 1].

![Gráfico - Quais são os seus maiores desafios na cozinha atualmente?](grafico_desafios_cozinha.png)

* **Desafios Principais na Cozinha:**
  * Falta de inspiração sobre o que cozinhar: 51,2% (43 respostas)[cite: 2].
  * Falta de tempo para planear as refeições: 40,5% (34 respostas)[cite: 2].
  * Dificuldade em organizar receitas de família: 13,1% (11 respostas)[cite: 2].
  * Desperdício de alimentos por falta de uso: 11,9% (10 respostas)[cite: 2].

* **Desperdício Alimentar:** Um dos objetivos iniciais da aplicação era ajudar o utilizador a desperdiçar menos comida[cite: 2]. No entanto, a análise das respostas mostrou que a maioria dos inquiridos raramente ou nunca deita fora alimentos por se estragarem (57,1%)[cite: 2]. Os restantes distribuem-se entre desperdício mensal (22,6%) e semanal (20,2%)[cite: 2]. Este resultado indica que o desperdício, embora continue a ser um problema relevante, não é a principal dor sentida por este público, pelo que deverá ter um papel secundário na estratégia da aplicação[cite: 2].

![Gráfico - Com que frequência deita fora alimentos por se estragarem no frigorífico ou despensa?](grafico_frequencia_desperdicio.png)

* **Armazenamento de Receitas:** Verificámos que a maioria das pessoas guarda as suas receitas sob a forma de capturas de ecrã no telemóvel (42,9% / 36 respostas)[cite: 2, 3], mantendo também favoritos no navegador ou redes sociais (39,3% / 33 respostas)[cite: 3] e cadernos ou livros de receitas físicos (34,5% / 29 respostas)[cite: 3]. Uma menor percentagem recorre a blocos de notas digitais (11,9% / 10 respostas)[cite: 3]. Esta prática torna difícil encontrar, organizar e reutilizar receitas, sendo um problema que a nossa aplicação resolve diretamente ao reunir todas as receitas num único local organizado e pesquisável[cite: 2].

![Gráfico - Como guarda e organiza atualmente as suas receitas favoritas?](grafico_armazenamento_receitas.png)

* **Utilização de Aplicações de Cozinha:** A maioria dos inquiridos nunca utilizou uma aplicação dedicada a gerir a despensa ou compras de supermercado (48,8%), mas manifestou curiosidade em experimentar[cite: 3]. Por outro lado, 42,9% indicaram não sentir necessidade, 4,8% já experimentaram mas desinstalaram e 3,6% usam regularmente[cite: 3]. Existe, assim, uma clara oportunidade de mercado para a nossa aplicação[cite: 3].

![Gráfico - Já utiliza alguma aplicação móvel para gerir a sua despensa ou compras de supermercado?](grafico_utilizacao_apps.png)

## Oportunidades Identificadas
Com base nos resultados, identificámos uma funcionalidade com bastante potencial: a sugestão de receitas com base nos ingredientes prestes a expirar na despensa do utilizador[cite: 3]. Quando questionados se considerariam útil esta funcionalidade numa escala de 1 a 5, a grande maioria dos inquiridos avaliou a ideia com a pontuação máxima de 5 (59,5% / 50 respostas) e 4 (17,9% / 15 respostas)[cite: 4]. Esta funcionalidade responde em simultâneo à falta de inspiração (o problema mais referido) e à redução do desperdício[cite: 3].

![Gráfico - Avaliação da funcionalidade de sugestão de receitas por ingredientes prestes a expirar](grafico_utilidade_sugestao_validade.png)

## Persona

![Cartão da Persona - Carla](persona_carla.png)

### Carla (50 Anos, Feminino)
* **Funções:** Utilizador[cite: 4].
* **Comportamentos:** Cozinha quase todos os dias e procura ideias na internet[cite: 4].
* **Objetivos:** Decidir o que cozinhar em poucos minutos, ter as receitas num só sítio, variar as refeições da semana e aproveitar o que tem em casa[cite: 4].
* **Motivações:** Quer ter as suas receitas organizadas e ter menos stress com a cozinha[cite: 4].
* **Obstáculos:** Falta de inspiração (51,2% dos questionados consideram isto o maior problema), receitas dispersas por capturas de ecrã (42,9%) e cadernos (34,5%), e pouca experiência com aplicações (48,8% nunca usaram uma app para a cozinha)[cite: 4].
* **Influências:** A família (que dá opinião sobre o que lhes apetece comer), a internet/redes sociais, e outros utilizadores e amigos que partilham receitas e truques[cite: 4].
* **Estória de uso:** Ao fim do dia, sem ideias para o jantar, a Carla abre o CookBook, vê sugestões com ingredientes que estão prestes a expirar e escolhe uma receita para cozinhar[cite: 4].

## User Journey Map (Mapa de Jornada do Utilizador)

![Mapa de Jornada do Utilizador - Joana](user_journey_map_joana.png)

* **User:** Joana, 50 anos. Cozinha quase todos os dias e tem uma rotina bem estabelecida, mas sente falta de ideias e repete sempre os mesmos pratos[cite: 5].
* **Cenário:** Planeia e prepara as refeições da semana; quer decidir o que cozinhar, comprar só o necessário e ter as receitas à mão quando precisa delas[cite: 5].
* **Objetivos & Expectativas:** Ter ideias novas e rápidas, sem passar muito tempo a pesquisar; aproveitar o que já tem em casa antes de se estragar; ter as receitas guardadas[cite: 5]. Expectativa de encontrar uma aplicação fácil de usar[cite: 5].

| Fase | Objetivo | Ações (Fazendo) | Pensamento | Sentimento | Oportunidades |
|---|---|---|---|---|---|
| **Inspiração** | Encontrar uma ideia para a refeição sem repetir sempre os mesmos pratos[cite: 5]. | Pergunta à família o que apetece comer; procura ideias na internet e redes sociais; folhea cadernos de receitas e vê capturas de ecrã guardadas[cite: 5]. | "O que é que vou fazer para o jantar?"; "Já estou farta de fazer sempre o mesmo"[cite: 5]. | Frustração (não sabe o que cozinhar)[cite: 5]. | Sistema de recomendação de receitas populares[cite: 5]. |
| **Planeamento e Compras** | Perceber o que falta e comprar apenas o necessário[cite: 5]. | Abre o frigorífico e despensa para ver o que tem; escreve a lista de compras em papel ou nas notas[cite: 5]. | "Será que ainda tenho ovos em casa?"; "Dava jeito ter uma app para isto"[cite: 5]. | Cansada (nunca sabe o que tem na despensa)[cite: 5]. | Funcionalidade de despensa na aplicação[cite: 5]. |
| **Cozinhar** | Encontrar a receita certa e segui-la sem complicações[cite: 5]. | Procura a receita entre capturas, favoritos e cadernos; segue os passos no telemóvel enquanto cozinha; adapta quantidades e improvisa com o que tem[cite: 5]. | "Onde é que eu guardei aquela receita?"[cite: 5]. | Confusa (não encontra a receita que quer)[cite: 5]. | Livro de receitas digital centralizado e pesquisável[cite: 5]. |
| **Guardar e Reaproveitar** | Guardar as receitas de que gosta e gastar os ingredientes antes de se estragarem[cite: 5]. | Tira uma captura de ecrã da receita de que gostou[cite: 5]. | "Esta ficou tão boa, tenho de a guardar"[cite: 5]. | Felicidade (gostou e guardou a receita)[cite: 5]. | Guardar receitas facilmente e sugestões inteligentes de reaproveitamento[cite: 5]. |

# Avaliação Heurística

# Requisitos e estratégia UX

# Síntese
