module SolidusModularFrontend
  class Engine < ::Rails::Engine
    isolate_namespace SolidusModularFrontend

    config.generators do |g|
      g.test_framework = nil
      g.integration_tool = nil
      g.stylesheets = false
      g.javascripts = false
      g.helper = nil
      g.template_engine = nil
    end

    # FIXME: Make configurable
    paths['app/views'] = 'app/views/web-1.0'

    initializer "solidus.modular_frontend.configure" do |app|
      app.config.checkout_steps = %i(
        address
        delivery
        payment
        confirm
        complete
      )

      app.config.solidus_modular_frontend = {
        cart: '/solidus_modular_frontend/cart',
        home: '/solidus_modular_frontend/home',
        layout: 'modular_frontend',
        products: '/solidus_modular_frontend/products',
        taxons: '/solidus_modular_frontend/taxons',
        checkout: {
          address: '/solidus_modular_frontend/checkout/address',
          delivery: '/solidus_modular_frontend/checkout/delivery',
          payment: '/solidus_modular_frontend/checkout/payment',
          confirm: '/solidus_modular_frontend/checkout/confirm',
          complete: '/solidus_modular_frontend/checkout/complete'
        }
      }
    end
  end
end
