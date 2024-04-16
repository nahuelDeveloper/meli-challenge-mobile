# meli-challenge-mobile
Challenge técnico de Meli para candidatos mobile

## Description
La app consiste en una pantalla principal con una barra de busqueda, que permite buscar cualquier producto disponible en la api para devs de Meli. Al hacer click en el botón buscar, se abre una nueva pantalla con un listado de productos relacionados a esa búsqueda. Por último, el usuario puede hacer click en cualquier producto, lo cual lo llevará la pantalla de detalle de dicho producto.

## Diseño, estructura de la app, y herramientas a utilizar.
Para el desarrollo de la app, utilizaré SwiftUI para la parte visual, y Combine para la lógica de negocio. Si bien en el último proyecto grande en el que trabajé utilizamos UIKit + vistas por código, y RxSwift para la lógica de negocio, me parece que este challenge es una buena oportunidad de utilizar y aprender mas en profundidad sobre otros frameworks.

En cuanto a la arquitectura de la app, uitilizaré MVVM-C. Me parece que MVVM es una buena opción para separar claramente la UI y lógica de negocio. De esta forma, podemos testear con mayor facilidad la lógica de negocio encapsulada en los view models, lo cual hace que el código sea mas simple, sencillo de entender, y mas práctico de mantener y reutilizar. En cuanto al patrón Coordinator, este nos permitirá separar la lógica de navegación de la UI.

Para el networking utilizaré una capa de Servicios, en donde cada Servicio se encargará de consumir una API y de parsear y devolver una entidad del Modelo de la app, o un error que también sera parte del Modelo de errores de la app. Primero implementaré unos Servicios mocks, y mas adelante utilizaré los Servicios definitivos que consumen las APIs de Meli. Para poder encararlo de esta forma utilizaré Injección de Dependencias en los View Models, esto me dará la flexibilidad de poder utilizar los Servicios mock durante el desarrollo, y los Servicios definitivos en última instancia.

Para la parte de testing, utilizaré XCTest y XCTestcase, y me enfocaré en los modelos y en los view models. De ser posible utilizaré XCUITest y XCUITestcase para testear la UI.

Para el manejo de git, utilizaré Git Flow, ya que me parece un buen mecanismo que permite llevar un historial prolijo y legible del repositorio. Los commits los escribiré en inglés, ya que me siento mas cómodo trabajando así.

Para probar las APIs que debo consumir desde la app, utilizaré Postman, ya que es una herramienta con la que vengo trabajando hace tiempo y me parece muy útil.

No pienso usar ninguna librería de terceros para este challenge, ya que prefiero enfocarme en los frameworks nativos de iOS. De ser necesario, utilizaré extensions de este fantástico repo: https://github.com/SwifterSwift/SwifterSwift

## Planificación

Mi idea es desarrollar la app en 3 etapas:
* Primera etapa: desarrollar una UI básica con mocks, sin consumir ninguna API todavía. En esta iteración aprovecharé para ir investigando la API mas en detalle. Voy a crear una primera version del Modelo, y de los View Models para las pantallas de búsqueda y detalle. Pienso implementar una 1era version del patrón Coordinator, que no se si será definitiva aún. También implementaré una 1era versión de los servicios, pero para que devuelvan mocks, no información de la API. Utilizando mocks, crearé algunos Unit Tests básicos para los View Models. La idea al finalizar esta 1er etapa es tener una app funcional con mock data, no muy agradable a la vista, pero con una estructura de archivos y carpetas que se asemejará a la versión final.
  
* Segunda etapa: en esta etapa implementaré los Servicios que la app necesitá para funcionar correctamente. Mi idea es agregar una capa de Networking que simplifique los llamados a la API. También conectare los View Models con sus respectivos Servicios, esta vez los definitivos, en vez de los mocks. Al finalizar esta etapa, debería tener una app funcionando con la API real (para devs) de Meli.

* Tercera etapa: en la etapa final, trataré de pulir la UI de la app, para que sea visualmente agradable a la vista. Me inspiraré lo mas posible en la app de iOS de Meli. En esta etapa también me gustaría agregar mas tests, y quizás realizar algun refactor en caso de ser necesario. En este momento me enfocaré en testear manualmente la app, asi que es posible que encuentre bugs o detalles que intentaré corregir antes del deadline de 1 semana.

## Retrospectiva

Luego de una semana, el challenge se encuentra listo para ser entregado. Creo que la planificación en etapas fue adecuada, especialmente la primera y la segunda. En la tercera etapa tuve que modificar varias partes del código, resolver bugs, y manejar el deseo de seguir agregando nuevas funcionalidades y mejorando las ya implementadas. Fue una etapa un poco mas atareada de lo que anticipaba, pero en líneas generales estoy conforme con el resultado. A continuación quisiera explicar un poco algunas decisiones que fui tomando durante el desarrollo, de cosas que hice y de cosas que no me dio el tiempo para hacer.

La implementación del Coordinator llevo mas tiempo de lo que pensaba. Estuve investigando distintas implementaciones, hasta que termine utilizando la que esta en la app actualmente. Preferi ir por algo 100% SwiftUI y no mezclar con UIKit, aunque no descarto que para un proyecto mas grande, sea conveniente recurrir al viejo y querido UINavigationController. Tendría que ver como responde mi implementación actual en una app mas grande, con Child Coordinators.

En cuanto a las sugerencias de búsqueda, me pareció una feature interesante para implementar. Considere implementar alguna API, pero me pareció demasiado esfuerzo para el tiempo disponible, por eso opte por utilizar un archivo local.

Considere crear un ImageService para manejar la carga de imágenes, implementar una cache, y hacerlo testeable, pero para este ejercicio creo que AsyncImage es suficiente.

En la pantalla de ProductsView, no hice a tiempo de implementar un paginado. Por ahora la app solo muestra como máximo los primeros 50 resultados. Lo ideal seria implementar una lógica de paginado con un LazyVStack, para ir pidiendo mas resultados a medida que el usuario scrollea y llega al final de la lista, y que sea mas óptimo.

No encontre una forma de mostrar un listado de sugerencias la primera vez que el usuario hace click en la barra de búsqueda. Esto queda un poco feo a nivel de UI, ya que se ve la vista principal de fondo. A medida que el usuario escribe el texto que desea buscar, si se muestra correctamente y se actualiza la lista de sugerencias.

Para el Storage en el dispositivo de textos de búsqueda del usuario, idealmente seguiría el mismo enfoque que para la capa de Networking. Usaria un protocolo, y tendría una clase concreta y una clase de mock.


