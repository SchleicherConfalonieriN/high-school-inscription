<?php require_once '../html/Layout.php'?>
<!DOCTYPE html>
<html lang="en">
  <body>
    <div id="content">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Listado de Materias</h5>
            </div>
            <div class="card-body">
                <table id="myTable" class="display">
                    <thead>
                        <tr>
                            <th>Materia</th>
                            <th>Profesor asignado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($this->subjects as $subject) { ?>
                            <tr>
                                <td><?=htmlentities($subject['name'])?></b>
                                <td><?=htmlentities($subject['teacher'])?></td>
                                <td>
                                    <?php if ($this->is_admin) { ?>
                                        <a href="editar-materia-<?=htmlentities($subject['id_subject'])?>-<?=$_GET['id']?>" class="btn btn-primary" title="Editar">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="#" class="btn btn-danger" title="Eliminar" onclick="onDelete(<?=htmlentities($subject['id_subject'])?>, <?=$_GET['id']?>)">
                                            <i class="fa fa-trash"> </i>
                                        </a>
                                    <?php } else { ?>
                                        <a href="inscribirse-<?=htmlentities($this->user_id)?>-<?=htmlentities($subject['id_subject'])?>" class="btn btn-success" title="Inscribirse">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    <?php } ?>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
            <?php if ($this->is_admin) { ?>
                <div class="card-footer">
                    <a href="agregar-materia-<?=$_GET['id']?>" class="btn btn-success">Agregar materia</a>
                <div>
            <?php } ?>
        </div>
    </div>
  </body>
  <script>
        function onDelete(subjectId, careerId) {
            console.log("materia", subjectId);
            console.log("carrera", careerId);
            if (confirm("¿Esta seguro que quiere borrar la materia?")) {
                window.location = `borrar-materia-${subjectId}-${careerId}`;
            }
        }
      $(document).ready( function () {
          $('#myTable').DataTable();
      } );
  </script>
</html>