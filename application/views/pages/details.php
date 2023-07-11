<!DOCTYPE html>
<html lang="en">

<?php $this->load->view('inc/header_index'); ?>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
              <img src=<?php echo base_url("assets/images/logo.svg"); ?> alt="logo">
              </div>
              <form class="pt-3">
                <div class="form-group">
                  <input type="number" class="form-control form-control-lg" min="0" id="exampleInputUsername1" placeholder="Height">
                </div>
                <div class="form-group">
                  <input type="number" class="form-control form-control-lg" min="0" id="exampleInputUsername1" placeholder="Weight">
                </div>
                <div class="form-group">
                  <select class="form-control form-control-lg" id="exampleFormControlSelect2">
                    <option>Goal</option>
                    <option>Reduce your weight</option>
                    <option>Increase your weight</option>
                  </select>
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN UP</a>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Already have an account? <a href="<?php echo site_url('regime/login'); ?>" class="text-primary">Login</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <?php $this->load->view('inc/footer_index'); ?> 
</body>

</html>
