package ca.uhn.fhir.jpa.starter;

import ca.uhn.fhir.jpa.packages.IgInstallerSvc;
import ca.uhn.fhir.jpa.packages.ImplementationGuideInstallationException;
import org.hl7.fhir.utilities.cache.NpmPackage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

public class ImplementationGuideInstallationListener implements ApplicationListener<ContextRefreshedEvent> {

  private static final Logger ourLog = LoggerFactory.getLogger(ImplementationGuideInstallationListener.class);

  @Autowired
  private IgInstallerSvc igInstaller;

  private boolean installed = false;

  @Override
  public void onApplicationEvent(ContextRefreshedEvent event) {
    if (!installed) {
      installIg();
      installed = true;
    }
  }

  private void installIg() {
    String url = HapiProperties.getMyImplementationGuideURL();
    String id = HapiProperties.getMyImplementationGuideID();
    String ver = HapiProperties.getMyImplementationGuideVersion();
    NpmPackage ig = null;

    if (url != null && !url.isEmpty()) {
      if (id != null && !id.isEmpty()) {
        ourLog.warn("Only one of myImplementationGuideURL and myImplementationGuideID " +
          "should be set. Using {} to fetch implementation guide", url);
      }
      igInstaller.install(url);
    } else if (id != null && !id.isEmpty()) {
      igInstaller.install(id, ver);
    }
  }
}
