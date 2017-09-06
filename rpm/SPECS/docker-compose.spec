Name:           docker-compose
Version:        1.16.1
Release:        1
Summary:        Short description (first char has to be uppercase)

License:        GPL
##URL:            

BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
#                 rpm/BUILD/docker-compose-1.16.1-1.x86_64

##BuildRequires:  

%description
Description with almost 79 characters (first char has to be uppercase)

#This is a comment (just as example)

%prep
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/bin
cp %{name}-%{version}-%{release}.x86_64 $RPM_BUILD_ROOT/usr/bin/%{name}

%files
%defattr(755,root,root)
%{_bindir}/docker-compose


##/usr/share/applications/package_name.desktop
##/usr/share/pixmaps/package_name.png

%changelog


