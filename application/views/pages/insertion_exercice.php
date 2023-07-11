<!DOCTYPE html>
<html lang="en">

<?php $this->load->view('inc/header'); ?>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <?php $this->load->view('inc/navbar'); ?>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      <?php $this->load->view('inc/panel'); ?>
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
      
      <?php $this->load->view('inc/sidebar'); ?>
      
      <!-- partial -->
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Insertion d'exercice</h4>
                  <form class="forms-sample">
                    <div class="form-group row">
                      <label for="exampleInputMobile" class="col-sm-3 col-form-label">Nom</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="exampleInputMobile" placeholder="Nom de l'exercice">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Calories dépensées</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" id="exampleInputPassword2" placeholder="Calories dépensées par cet exercice">
                      </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">Insérer</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Tous les activités sportives</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>Nom</th>
                          <th>Durée</th>
                          <th>Efficacité</th>
                          <th></th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Jacob</td>
                          <td>53275531</td>
                          <td>2</td>
                          <td><a href="<?php echo site_url('regime/regimeEdit'); ?>" type="button" class="btn btn-dark btn-icon-text">Modifier<i class="typcn typcn-edit btn-icon-append"></i></a></td>
                          <td><button type="button" class="btn btn-danger">Supprimer</button></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <?php $this->load->view('inc/footer'); ?>
</body>

</html>
