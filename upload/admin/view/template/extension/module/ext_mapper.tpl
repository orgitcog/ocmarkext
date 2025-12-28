<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-ext-mapper" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-ext-mapper" class="form-horizontal">
          
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab">General</a></li>
            <li><a href="#tab-extensions" data-toggle="tab">Extensions</a></li>
            <li><a href="#tab-mapping" data-toggle="tab">Functionality Mapping</a></li>
            <li><a href="#tab-recommendations" data-toggle="tab">Recommendations</a></li>
          </ul>
          
          <div class="tab-content">
            <!-- General Tab -->
            <div class="tab-pane active" id="tab-general">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="module_ext_mapper_status" id="input-status" class="form-control">
                    <?php if ($module_ext_mapper_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            
            <!-- Extensions Tab -->
            <div class="tab-pane" id="tab-extensions">
              <div class="well">
                <h4>Browse Extensions by Category</h4>
                <p>View and organize extensions based on their functionality categories.</p>
              </div>
              
              <div class="row">
                <?php foreach ($categories as $category) { ?>
                <div class="col-md-4 col-sm-6">
                  <div class="panel panel-info">
                    <div class="panel-heading">
                      <h3 class="panel-title">
                        <i class="fa <?php echo htmlspecialchars($category['icon'], ENT_QUOTES, 'UTF-8'); ?>"></i> 
                        <?php echo htmlspecialchars($category['name'], ENT_QUOTES, 'UTF-8'); ?>
                      </h3>
                    </div>
                    <div class="panel-body">
                      <p><?php echo htmlspecialchars($category['description'], ENT_QUOTES, 'UTF-8'); ?></p>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
              
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Extension Name</td>
                      <td class="text-left">Category</td>
                      <td class="text-center">Rating</td>
                      <td class="text-center">Downloads</td>
                      <td class="text-right">Price</td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($extensions) { ?>
                      <?php foreach ($extensions as $extension) { ?>
                      <tr>
                        <td class="text-left">
                          <strong><?php echo htmlspecialchars($extension['name'], ENT_QUOTES, 'UTF-8'); ?></strong>
                          <br/>
                          <small><?php echo htmlspecialchars($extension['description'], ENT_QUOTES, 'UTF-8'); ?></small>
                        </td>
                        <td class="text-left"><?php echo htmlspecialchars($extension['category_name'], ENT_QUOTES, 'UTF-8'); ?></td>
                        <td class="text-center">
                          <?php if ($extension['rating']) { ?>
                            <?php echo number_format($extension['rating'], 1); ?> <i class="fa fa-star text-warning"></i>
                          <?php } else { ?>
                            <span class="text-muted">N/A</span>
                          <?php } ?>
                        </td>
                        <td class="text-center"><?php echo number_format($extension['downloads']); ?></td>
                        <td class="text-right">
                          <?php if ($extension['price'] > 0) { ?>
                            $<?php echo number_format($extension['price'], 2); ?>
                          <?php } else { ?>
                            <span class="text-success">Free</span>
                          <?php } ?>
                        </td>
                      </tr>
                      <?php } ?>
                    <?php } else { ?>
                      <tr>
                        <td class="text-center" colspan="5">No extensions added yet. Add extensions to start mapping functionality.</td>
                      </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
            
            <!-- Functionality Mapping Tab -->
            <div class="tab-pane" id="tab-mapping">
              <div class="well">
                <h4>Functionality-Based Extension Mapping</h4>
                <p>Extensions are organized by their core functionalities to help you find the right tools for your needs.</p>
              </div>
              
              <div class="row">
                <div class="col-md-12">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h3 class="panel-title">Key Functionalities</h3>
                    </div>
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-md-4">
                          <h5><i class="fa fa-credit-card"></i> Payment Processing</h5>
                          <p class="text-muted">Extensions for handling online payments</p>
                        </div>
                        <div class="col-md-4">
                          <h5><i class="fa fa-search"></i> SEO Optimization</h5>
                          <p class="text-muted">Tools to improve search rankings</p>
                        </div>
                        <div class="col-md-4">
                          <h5><i class="fa fa-envelope"></i> Email Marketing</h5>
                          <p class="text-muted">Customer communication solutions</p>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-4">
                          <h5><i class="fa fa-share-alt"></i> Social Integration</h5>
                          <p class="text-muted">Social media sharing and login</p>
                        </div>
                        <div class="col-md-4">
                          <h5><i class="fa fa-chart-line"></i> Analytics</h5>
                          <p class="text-muted">Track and analyze store performance</p>
                        </div>
                        <div class="col-md-4">
                          <h5><i class="fa fa-mobile-alt"></i> Mobile Responsive</h5>
                          <p class="text-muted">Optimize for mobile devices</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Recommendations Tab -->
            <div class="tab-pane" id="tab-recommendations">
              <div class="well">
                <h4>Extension Recommendations by Use Case</h4>
                <p>Get customized extension recommendations based on your specific business needs and use cases.</p>
              </div>
              
              <?php foreach ($use_cases as $use_case) { ?>
              <div class="panel panel-success">
                <div class="panel-heading">
                  <h3 class="panel-title">
                    <i class="fa <?php echo htmlspecialchars($use_case['icon'], ENT_QUOTES, 'UTF-8'); ?>"></i> 
                    <?php echo htmlspecialchars($use_case['name'], ENT_QUOTES, 'UTF-8'); ?>
                  </h3>
                </div>
                <div class="panel-body">
                  <p><?php echo htmlspecialchars($use_case['description'], ENT_QUOTES, 'UTF-8'); ?></p>
                  <div class="alert alert-info">
                    <strong>Recommended Extensions for this use case:</strong>
                    <ul>
                      <li>Payment Gateway (Essential for processing orders)</li>
                      <li>Shipping Integration (Calculate shipping costs)</li>
                      <li>SEO Tools (Improve visibility)</li>
                      <li>Email Marketing (Customer engagement)</li>
                    </ul>
                    <p class="text-muted"><em>Note: Add extensions to the database to see personalized recommendations.</em></p>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
            
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
