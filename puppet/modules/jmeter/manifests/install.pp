class jmeter::install {
    $jmeterversion="apache-jmeter-2.10"
    $stdpluginversion="1.1.1"

    file { "/usr/bin/jmeter":
        ensure =>"file",
        mode    =>0755,
        content =>template("jmeter/jmeter.sh.erb"),
    }
    package { ['xorg-x11-xauth', 'libXtst'] :
        ensure=>present,
    }

    
# Downloads:
    exec { "Download jmeter":
        command => "wget -c http://apache.cs.utah.edu/jmeter/binaries/${jmeterversion}.tgz -O /tmp/${jmeterversion}.tgz",
#        command => "wget -c http://mirrors.ibiblio.org/apache/jmeter/binaries/${jmeterversion}.tgz -O /tmp/${jmeterversion}.tgz",
        creates => "/tmp/${jmeterversion}.tgz",
        timeout => 360,
        path    =>['/usr/bin'],
    }

    #from http://jmeter-plugins.org/

    exec { "Download JMeterPlugins-Standard":
        command => "wget -c http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-${stdpluginversion}.zip -O /tmp/JMeterPlugins-Standard-${stdpluginversion}.zip",
        creates => "/tmp/JMeterPlugins-Standard-${stdpluginversion}.zip",
        timeout => 360,
        require =>Exec["Download jmeter"],
        path    =>['/usr/bin'],
    }
    exec { "Download JMeterPlugins-Extras":
        command => "wget -c http://jmeter-plugins.org/downloads/file/JMeterPlugins-Extras-${stdpluginversion}.zip -O /tmp/JMeterPlugins-Extras-${stdpluginversion}.zip",
        creates => "/tmp/JMeterPlugins-Extras-${stdpluginversion}.zip",
        timeout => 360,
        require =>Exec["Download jmeter"],
        path    =>['/usr/bin'],
    }
    exec { "Download JMeterPlugins-ExtrasLibs":
        command => "wget -c http://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-${stdpluginversion}.zip -O /tmp/JMeterPlugins-ExtrasLibs-${stdpluginversion}.zip",
        creates => "/tmp/JMeterPlugins-ExtrasLibs-${stdpluginversion}.zip",
        timeout => 360,
        require =>Exec["Download jmeter"],
        path    =>['/usr/bin'],
    }
    exec { "Download JMeterPlugins-WebDriver":
        command => "wget -c http://jmeter-plugins.org/downloads/file/JMeterPlugins-WebDriver-${stdpluginversion}.zip -O /tmp/JMeterPlugins-WebDriver-${stdpluginversion}.zip",
        creates => "/tmp/JMeterPlugins-WebDriver-${stdpluginversion}.zip",
        timeout => 360,
        require =>Exec["Download jmeter"],
        path    =>['/usr/bin'],
    }





#Installs:

    exec { "Unzip JMeter" :
        command =>"tar -zxvf /tmp/${jmeterversion}.tgz -C /opt/",
        creates => "/opt/${jmeterversion}",
        require =>Exec["Download jmeter"],
        path    =>['/usr/bin', '/bin'],
    }
    exec { "Unzip JMeterPlugins-Standard" :
        command =>"unzip -o /tmp/JMeterPlugins-Standard-${stdpluginversion}.zip -d /opt/${jmeterversion}/",
        creates =>"/opt/${jmeterversion}/lib/ext/JMeterPlugins-Standard.jar",
        require =>Exec["Unzip JMeter"],
        path    =>['/usr/bin', '/bin'],
    }
    exec { "Unzip JMeterPlugins-Extras" :
        command =>"unzip -o /tmp/JMeterPlugins-Extras-${stdpluginversion}.zip -d /opt/${jmeterversion}/",
        creates =>"/opt/${jmeterversion}/lib/ext/JMeterPlugins-Extras.jar",
        require =>Exec["Unzip JMeter"],
        path    =>['/usr/bin', '/bin'],
    }
    exec { "Unzip JMeterPlugins-ExtrasLibs" :
        command =>"unzip -o /tmp/JMeterPlugins-ExtrasLibs-${stdpluginversion}.zip -d /opt/${jmeterversion}/",
        creates =>"/opt/${jmeterversion}/lib/ext/JMeterPlugins-ExtrasLibs.jar",
        require =>Exec["Unzip JMeter"],
        path    =>['/usr/bin', '/bin'],
    }
    exec { "Unzip JMeterPlugins-WebDriver" :
        command =>"unzip -o /tmp/JMeterPlugins-WebDriver-${stdpluginversion}.zip -d /opt/${jmeterversion}/",
        creates =>"/opt/${jmeterversion}/lib/ext/JMeterPlugins-WebDriver.jar",
        require =>Exec["Unzip JMeter"],
        path    =>['/usr/bin', '/bin'],
    }



}
