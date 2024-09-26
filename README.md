# Web Recon

## Description

**Web Recon** is a tool designed to facilitate information gathering about websites. With a set of features that automate the reconnaissance process, this tool is ideal for security professionals, developers, and enthusiasts looking to better understand the infrastructure of a web application.

## Features

- **Subdomain Enumeration**: Identify subdomains associated with a specific domain.
- **DNS Lookups**: Perform DNS queries to obtain detailed information about the domain.
- **Vulnerability Checking**: Integration with APIs to check for known vulnerabilities.
- **User-Friendly Interface**: Access all functionalities through a simple and intuitive interface.

## Prerequisites

- Python 3.7 or higher
- Required libraries (listed in `requirements.txt`)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/jacksoncastilho/web-recon.git
   ```

2. Navigate to the project directory:

   ```bash
   cd web-recon
   ```

3. Install the dependencies:

   ```bash
   pip install -r requirements.txt
   ```

## Usage

After installation, you can run the tool with the following command:

```bash
python webrecon.py <domain>
```

Replace `<domain>` with the domain you wish to investigate.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

