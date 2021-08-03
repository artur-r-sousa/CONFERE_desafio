# loja_tres_pontos

Desafio para a vaga de Desenvolvedor Jr. Flutter na Confere Cartoes

Especificação
O aplicativo deverá conter uma CRUD (Create, Read, Update, Delete) de produtos, os mesmos deverão ser persistidos em uma banco local no aplicativo, de maneira que mesmo que o aplicativo seja encerrado, ao abrir novamente, o mesmo deverá ser capaz de pegar a listagem atual de produtos; (CONCLUIDO)!

Na listagem de produtos, deverá ser apresentado os seguintes campos: (CONCLUIDO)
  Imagem
  Nome
  Preço
  Preço de promoção (se disponível)
 
  A listagem de produtos, deverá retornar os produtos ordenados de forma alfabética; (CONCLUIDO)
  Na criação e edição de produtos deverá ser apresentados os seguintes campos para preenchimento: (CONCLUIDO COM PONTOS EXTRAS INCLUSOS)
  Nome (String - obrigatório)
  Preço (double - obrigatório)
  Preço de promoção (double)
  Percentual de desconto (double)
  Disponível para venda (bool)
  
  Ao salvar, deverá ser validado a obrigatoriedade dos campos e em caso de não cumprimento de alguma regra, deverá ser apresentada uma mensagem de erro em baixo do campo e o     mesmo deverá ser destacado em vermelho;

  Ao salvar um produto (criação ou edição) deverá ser redirecionado para a listagem de produtos, com a mesma atualizada e apresentar um Snackbar, informando o sucesso na         operação; (CONCLUIDO)
  Na edição de um produto, deverá conter um botão para exclusão do produto, que ao ser clicado, será apresentado um Dialog para confirmação da ação, em caso de afirmação, o       mesmo deverá ser deletado do banco e a listagem ser atualizada. apresentando uma Snackbar, informando o sucesso na operação;
  Requisitos (CONCLUIDO)
  
  Deverá ser desenvolvido utilizando Flutter; (CONCLUIDO)
  Deverá utilizar BloC para gerência de estado; (CONCLUIDO)(CONCLUIDO)
  
  
  Pontos Extras

  Na listagem, adicione a funcionalidade de excluir um item utilizando o plugin https://pub.dev/packages/flutter_slidable (CONCLUIDO)
  Adicione um ícone para seu aplicativo e disponibilize ele como APK; (CONCLUIDO)
  Adicione os campos restantes do json, nos formulário de edição e adição; (CONCLUIDO)
  
  
  
![main_](https://user-images.githubusercontent.com/49071350/128047375-dc9999c8-ed3b-4bc1-9685-b469b61b414d.jpg)
![main_slidable](https://user-images.githubusercontent.com/49071350/128047378-a9c73c5d-6f3b-4d28-abc5-fa132abb9609.jpg)
![add_](https://user-images.githubusercontent.com/49071350/128047507-c4de7ef4-cff8-4806-b6ba-c9eb9eb9166e.jpg)
![detail_](https://user-images.githubusercontent.com/49071350/128047547-8f152241-f981-4133-bb30-15aa4f20dc50.jpg)

