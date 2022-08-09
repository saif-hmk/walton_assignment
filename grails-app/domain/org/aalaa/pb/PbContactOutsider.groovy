package org.aalaa.pb

import org.aalaa.pb.PbContact

class PbContactOutsider extends PbContact {

    String organization,
           organizationAddress,
           organizationAddressNative,
           organizationWebsite,
           organizationEmail,
           organizationPhone,
           organizationMobile,
           department,
           designation,
           othersInformation,
           specialInstruction

    static constraints = {
        organization              nullable: true
        organizationAddress       nullable: true
        organizationAddressNative nullable: true
        organizationWebsite       nullable: true
        organizationEmail         nullable: true
        organizationPhone         nullable: true
        organizationMobile        nullable: true
        department                nullable: true
        designation               nullable: true
        othersInformation         nullable: true
        specialInstruction        nullable: true
    }
}
