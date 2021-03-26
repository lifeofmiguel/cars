require_relative './config/environment'

use Rack::MethodOverride

use UsersController
use CarController
use SessionsController
run ApplicationController