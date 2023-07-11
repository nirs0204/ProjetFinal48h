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
                  <h4 class="card-title">Insertion de l'activité sportive</h4>
                  <form class="forms-sample">
                    <div class="form-group row">
                      <label for="exampleInputMobile" class="col-sm-3 col-form-label">Nom</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="exampleInputMobile" placeholder="Nom de l'activité sportive">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Durée</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" id="exampleInputConfirmPassword2" placeholder="Durée de l'activité sportive">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Taux d'éfficacité</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" id="exampleInputPassword2" placeholder="Taux d'éfficacité de l'activité sportive">
                      </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">Modifier</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <?php $this->load->view('inc/footer'); ?>
        </body>

</html>
