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
                  <h4 class="card-title">Insertion du menu</h4>
                  <form class="forms-sample">
                    <div class="form-group row">
                      <label for="exampleInputMobile" class="col-sm-3 col-form-label">Nom</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="exampleInputMobile" placeholder="Nom du repas">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Calorie donnée</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" id="exampleInputPassword2" placeholder="Calorie donnée par le repas">
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
                    <div class="form-group row">
                      <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Viande (en %)</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" id="exampleInputPassword2" placeholder="pourcentage de viande">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Poisson (en %)</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" id="exampleInputPassword2" placeholder="pourcentage de poisson">
                      </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">Insérer</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        <!-- content-wrapper ends -->
        <?php $this->load->view('inc/footer'); ?>
</body>

</html>
