# Meu Projeto Flutter

## 📹 Demonstração

Você pode assistir ao vídeo de demonstração que mostra a abertura do aplicativo para cada empresa e a seleção de um filtro:

[![Assista ao vídeo]]([https://www.youtube.com/watch?v=ID_DO_VIDEO](https://youtube.com/shorts/GvVRqMlqkj8))



## 📝 Descrição

Este projeto foi desenvolvido em **2 dias**, com o objetivo de entregar uma solução funcional dentro do prazo proposto. O aplicativo permite a navegação entre diferentes empresas e a aplicação de filtros personalizados.

## 🚀 Funcionalidades

- Seleção de empresa
- Aplicação de filtros personalizados
- Estrutura preparada para micro frontends

## 🔧 Melhorias Futuras

Se tivesse mais tempo para refinar o projeto, eu realizaria as seguintes melhorias:

1. **Interface de Usuário (UI)**: Aperfeiçoaria o design da interface, focando em proporcionar uma melhor experiência visual e usabilidade.
  
2. **Otimização da Recursividade**: Otimizaria melhor o tempo de execução nas chamadas recursivas feitas para montar os nós das entidades, garantindo mais eficiência no processo.
  
3. **Abstração do Cliente HTTP**: Criaria uma camada de abstração para o cliente HTTP, facilitando futuras mudanças ou integrações com outras bibliotecas de requisições.

4. **Abstração do Bloc Builder**: Abstrairia o uso do `BlocBuilder` das telas, tornando possível a migração para outro gerenciador de estado, caso necessário.

5. **Abstração da Navegação**: Criaria uma abstração para o sistema de navegação, permitindo a integração com outros gerenciadores de rotas futuramente.

6. **Substituição de Assets de Imagem**: Substituiria os assets de imagem por ícones e criaria uma fonte personalizada para o projeto, otimizando o desempenho e a manutenção dos recursos gráficos.

7. **Internacionalização (i18n)**: Implementaria suporte para múltiplos idiomas, tornando o aplicativo acessível para diferentes regiões e públicos.

8. **Sistema de Tema**: Adicionaria um sistema de temas, com uma paleta de cores diretamente vinculada ao contexto, permitindo uma personalização mais robusta e amigável ao usuário.

9. **Otimização do `ListView.builder`**: A otimização do `ListView.builder` poderia ter sido melhor, mas devido ao tempo, não foi possível explorar todas as soluções de desempenho.

10. **Melhoria na Paralelização**: Com mais tempo, revisaria como paralelizar melhor as chamadas recursivas, possivelmente utilizando uma abordagem com `ListQueue()` para lidar com listas dinâmicas de maneira mais eficiente.

## 🛠 Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento mobile
- **Dart**: Linguagem de programação

## 📂 Estrutura de Micro Frontends

Este projeto foi desenvolvido com uma arquitetura preparada para trabalhar com **Micro Frontends**, permitindo a modularização de diferentes partes do aplicativo e facilitando a integração futura de novas funcionalidades.
