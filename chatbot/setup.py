from setuptools import setup, find_packages

setup(
    name='myapp',
    version='1.0.0',
    description='Calendar bot for Telegram',
    author='Saveli Ivashkov',
    author_email='ivshkvs@gmail.com',
    packages=find_packages(),
    install_requires=[
        'requests',
        'numpy'
    ],
    entry_points={
        'console_scripts': [
            'myapp=app:main'
        ]
    }
)
