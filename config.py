import os
from dotenv import dotenv_values

env = {
    **dotenv_values(".env.dist"),  # load shared development variables
    **dotenv_values(".env.dist.local"),  # load sensitive variables
    **os.environ,  # override loaded values with environment variables
}
