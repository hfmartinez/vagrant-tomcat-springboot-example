# Vagrant Project with Apache Tomcat and Spring Boot

This project uses Vagrant to provision a virtual environment that installs Apache Tomcat and runs a Spring Boot application, automating the setup with shell scripts. Ideal for consistent development and testing.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Vagrant 2.4.1**: [Download Vagrant](https://www.vagrantup.com/downloads)

- **VirtualBox**: [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Local Execution

1. Clone the repository:

```
   git clone https://github.com/hfmartinez/vagrant_example.git
   cd vagrant_example
```

2. Start the environment:

```
vagrant up
```

3. Once the setup is complete, access the application in your web browser at:

```
http://localhost:8080
```

## Validation

To validate that the application is running, navigate to http://localhost:8080 in your browser. You should see the application’s homepage.

## Troubleshooting

If you encounter any issues during setup or execution, consider the following:

- Ensure that both Vagrant and VirtualBox are installed correctly.
- Check the output of the `vagrant up` command for any errors.
- Make sure your firewall settings allow connections to port 8080.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
