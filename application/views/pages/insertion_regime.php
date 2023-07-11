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
                  <h4 class="card-title">Insertion du régime</h4>
                  <form class="forms-sample">
                    <div class="form-group row">
                      <label for="exampleInputMobile" class="col-sm-3 col-form-label">Nom</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="exampleInputMobile" placeholder="Nom du régime">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Taux d'éfficacité</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" id="exampleInputPassword2" placeholder="Taux d'éfficacité du régime">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Prix</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" id="exampleInputConfirmPassword2" placeholder="Prix du régime">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Type</label>
                      <div class="col-sm-9">
                        <select class="form-control" name="">
                          <option value="0">Réduit le poids</option>
                          <option value="1">Augmente le poids</option>
                        </select>
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
                  <h4 class="card-title">Tous les régimes</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>Nom</th>
                          <th>Prix</th>
                          <th>Efficacité</th>
                          <th>Type</th>
                          <th></th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Jacob</td>
                          <td>53275531</td>
                          <td>2</td>
                          <td>reduit le poids</td>
                          <td><a href="<?php echo site_url('regime/activiteEdit'); ?>" type="button" class="btn btn-dark btn-icon-text">Modifier<i class="typcn typcn-edit btn-icon-append"></i></a></td>
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
