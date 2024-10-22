# Tractian Challenge

## 📹 Demonstração
[!](https://github.com/user-attachments/assets/ac59da1a-f9bc-4825-b86b-ad49e652c897)

## 📝 Descrição
Aplicativo desenvolvido para facilitar a navegação entre diferentes empresas, permitindo ao usuário aplicar filtros personalizados para refinar a visualização de dados. A aplicação foi construída com uma arquitetura modular, proporcionando flexibilidade e fácil manutenção.

## 🚀 Funcionalidades Principais
- **Navegação entre Empresas**: Explore informações de diversas empresas através de uma interface intuitiva.
- **Filtros Personalizados**: Aplique filtros específicos para ajustar a visualização de dados conforme suas necessidades.


## 🔧 Melhorias Futuras
Para tornar o aplicativo mais robusto e preparado para o crescimento, foram identificadas as seguintes melhorias futuras:

1. **Abstração do Cliente HTTP**: Implementar uma camada de abstração para o cliente HTTP, permitindo que a integração com diferentes bibliotecas de requisições seja facilmente substituível, melhorando a manutenção e a escalabilidade.

2. **Refatoração do BlocBuilder**: Abstrair o uso do `BlocBuilder` nas telas para reduzir o acoplamento ao `Bloc` e possibilitar a adoção de outros gerenciadores de estado, caso necessário.

3. **Abstração do Sistema de Navegação**: Criar uma camada de abstração para o sistema de navegação, facilitando futuras mudanças para outros gerenciadores de rotas, como `GoRouter` ou `AutoRoute`, sem a necessidade de grandes refatorações.

4. **Internacionalização (i18n)**: Adicionar suporte a múltiplos idiomas, tornando o aplicativo mais acessível a usuários de diferentes regiões e garantindo uma experiência personalizada para cada público.

5. **Sistema de Temas Dinâmicos**: Implementar um sistema de temas com suporte a modos claro e escuro, proporcionando uma paleta de cores adaptável ao contexto e melhorando a experiência do usuário em diferentes ambientes de iluminação.

6. **Testes Unitários**: Incluir testes unitários para garantir que as regras de negócio sejam corretamente aplicadas, validando a precisão de cada caso de uso e garantindo que os estados apresentados na interface estejam de acordo com as expectativas.

## 📂 Arquitetura de Micro Frontends
Este projeto adota uma arquitetura preparada para trabalhar com **Micro Frontends**, permitindo a modularização de diferentes funcionalidades e componentes do aplicativo. Essa abordagem facilita a integração de novas features e melhorias de forma independente, mantendo a base do código organizada e escalável
