# How to Trust SSL Local Development ASP.Net 9 in Rocky Linux 

To enable HTTPS for your ASP.NET 9 application during local development on Rocky Linux, you'll need to generate a self-signed SSL certificate and configure your system to trust it.

1. Install the .NET SDK
2. Generate a Self-Signed Certificate

    ```bash
    dotnet dev-certs https -ep ./aspnetapp.pfx -p <password>

    ```

3. Trust the Certificate

    On Linux systems, trusting a certificate involves adding it to your system's trusted certificate store. The process can vary depending on the distribution. 
    
    For Rocky Linux, follow these steps:
    - Convert the PFX File to PEM Format
        ```bash
        openssl pkcs12 -in aspnetapp.pfx -nokeys -out aspnetapp.crt
        ```

    - Copy the Certificate to the Trusted Store.

        Move the aspnetapp.crt file to the <code>/etc/pki/ca-trust/source/anchors/</code> directory

        ```bash
        sudo cp aspnetapp.crt /etc/pki/ca-trust/source/anchors/
        ```
    - Update the CA Trust

        Update the system's CA trust to include the new certificate

        ```bash
        sudo update-ca-trust
        ```
        The command adds the certificate to the system's trusted certificates

4. Configure ASP.NET Core to Use the Certificate. 

    In the <code>appsettings.Development.json</code>, add:
    ```yaml
    {
        "Kestrel": 
        {
            "Endpoints": 
            {
                "Https": 
                {
                    "Url": "https://localhost:5001",
                    "Certificate": 
                    {
                        "Path": "/path/to/aspnetapp.pfx",
                        "Password": "<password>"
                    }
                }
            }
        }
    }

    ```

5. Run Your Application