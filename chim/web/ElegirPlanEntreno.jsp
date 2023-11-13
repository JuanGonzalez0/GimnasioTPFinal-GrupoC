

<%@page import="clases.PlanEntrenamiento"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Elegir un Plan de Entrenamiento</title>
        <link rel="stylesheet" href="ElegirPlanEntreno.css"/>
    </head>
    <body>
        <div class="pagina">
            <div class="contenedor">
                <h1>Elige un Plan de Entrenamiento</h1>

                <form action="ListaPlanesServlet" method="get">
                    <input type="submit" value="Elegir Plan">
                </form>
            </div>
        </div>
    </body>
</html>


