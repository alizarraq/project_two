json.partial! "users/user", user: @user
<h1 class="text-center mt-4">Log in</h1>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-10">
      <%= form_with(scope: :session, url: login_path, class: "shadow p-3 mb-3 bg-info rounded", local: true) do |f| %>
        <div class="form-group row">
          <%= f.label :email, class: "col-2 col-form-label text-light" %>
          <div class="col-10"> 
            <%= f.email_field :email, class: "form-control shadow rounded", placeholder: "Enter your email address" %>
          </div>
        </div>

        <div class="form-group row">
          <%= f.label :password, class: "col-2 col-form-label text-light" %>
          <div class="col-10"> 
            <%= f.password_field :password, class: "form-control shadow rounded", placeholder: "Enter your password" %>
          </div>
        </div>

        <div class="form-group row justify-content-center">
          <%= f.submit "Log in", class: "btn btn-outline-light btn-lg" %>
        </div>
      <% end %>
    </div>
    <div class="mb-3">
      Don't have an account? <%= link_to "Sign up", signup_path, class: "text-info" %>
    </div>
  </div>
</div>