from setuptools import setup, find_packages

setup(
    name='democlient',
    version='0.1',
    description='',
    author='',
    author_email='',
    packages=find_packages(),
    entry_points={
        "console_scripts": ['democlient = democlient.democlient:main']
    },
)
